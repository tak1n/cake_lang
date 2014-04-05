class CakeLang::Parser

# These are the token types Racc should know about. They are the same as the
# lexer's token types.
token T_INT T_FLOAT
token T_ADD T_DIV T_MUL T_SUB T_MOD T_EXP T_EQ
token T_KEYWORD_DEF T_KEYWORD_END T_KEYWORD_OUT
token T_LITERAL
token T_RBR T_LBR T_DQUOTE T_COL

rule

program
  : block
  # : stmts { result = [:program, val[0]] }
  ;

block
  : stmts { result = [:block, val[0]] }
  ;

# in this rule the recursion is happening via | stmts stmt - this is saying stmts can contain stmts(=stmts + stmt) + stmt
# this enables the parser to allow multiple lines in block and so on... (method_definition with multiple lines)
stmts
  : stmt { result = [:stmt, val[0]] }
  | stmts stmt {
      result.push val[1]
   }
  ;

stmt
  : defn { result = val[0] }
  | call { result = val[0] }
  | expr { result = val[0] }
  ;

defn
  : T_KEYWORD_DEF T_LITERAL T_LBR arglist T_RBR block T_KEYWORD_END { 
      result = [:defn, val[1], val[3], val[5]]
    }
  ;

arglist
  : var
  | var T_COL var {
      result = [:arglist]
      val.each do |value|
        result << value unless value.eql?(',')
      end
    }
  | arglist T_COL var { result.push val[2] }
  | /* none */ { result = [:arglist, nil] }

expr
  : var T_EQ expr { result = [:equal, val[0], val[2]] }
  | var
  | T_KEYWORD_OUT expr { result = [:stdout, val[1]] }
  | operation { result = [:op, val[0]] }
  |
  ;

operation
  : var T_ADD var { result = [:add, val[0], val[2]] }
  | var T_SUB var { result = [:sub, val[0], val[2]] }
  | var T_MUL var { result = [:mul, val[0], val[2]] }
  | var T_DIV var { result = [:div, val[0], val[2]] }
  | var T_MOD var { result = [:mod, val[0], val[2]] }
  | var T_EXP var { result = [:exp, val[0], val[2]] }
  | operation T_ADD var { result = [:add, [:op, val[0]], val[2]] }
  | operation T_SUB var { result = [:sub, [:op, val[0]], val[2]] }
  | operation T_MUL var { result = [:mul, [:op, val[0]], val[2]] }
  | operation T_DIV var { result = [:div, [:op, val[0]], val[2]] }
  | operation T_MOD var { result = [:mod, [:op, val[0]], val[2]] }
  | operation T_EXP var { result = [:exp, [:op, val[0]], val[2]] }
  ;

var
  : T_LITERAL { result = [:literal, val[0].to_sym] }
  | T_INT { result = [:int, val[0]] }
  | T_FLOAT { result = [:float, val[0]] }
  ;

call
  : T_LITERAL T_LBR arglist T_RBR { result = [:call, val[0], val[2]] }
  ;

end

---- inner

  def parse(tokens)
    @tokens = tokens

    do_parse
  end

  #
  # Returns the next token to process
  # @return [Array]
  #
  def next_token
    @tokens.shift
  end

  def on_error(type, value, stack)
    raise Racc::ParseError, "Dudulo parser error - Error Type: #{type.inspect}\nCurrent Stack: #{stack.inspect}\nInvalid Token: #{value.inspect}"
  end

