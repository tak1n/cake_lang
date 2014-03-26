%%{

  machine lexer;

  access @;

  T_KEYWORD_DEF = '->';
  T_KEYWORD_END = '<-';
  T_DQUOTE      = '"';
  T_INT         = ('+'|'-')?[0-9]+;
  T_FLOAT       = ('+'|'-')?[0-9]+'.'[0-9];
  T_LITERAL     = [a-zA-Z_][a-zA-Z_0-9]*;
  T_ADD         = '+';
  T_SUB         = '-';
  T_MUL         = '*';
  T_DIV         = '/';
  T_MOD         = '%';
  T_EXP         = '^';
  T_LBR         = '(';
  T_RBR         = ')';
  T_EQ          = '=';
  T_COL         = ',';

  main := |*

    T_KEYWORD_DEF => {
      emit(:T_KEYWORD_DEF)
    };

    T_KEYWORD_END => {
      emit(:T_KEYWORD_END)
    };

    T_DQUOTE => {
      emit(:T_DQUOTE)
    };

    T_INT => {
      emit(:T_INT)
    };

    T_FLOAT => {
      emit(:T_FLOAT)
    };

    T_LITERAL => {
      emit(:T_LITERAL)
    };

    T_ADD => {
      emit(:T_ADD)
    };

    T_SUB => {
      emit(:T_SUB)
    };

    T_MUL => {
      emit(:T_MUL)
    };

    T_DIV => {
      emit(:T_DIV)
    };

    T_EXP => {
      emit(:T_EXP)
    };

    T_MOD => {
      emit(:T_MOD)
    };

    T_LBR => {
      emit(:T_LBR)
    };

    T_RBR => {
      emit(:T_RBR)
    };

    T_EQ => {
      emit(:T_EQ)
    };

    T_COL => {
      emit(:T_COL)
    };

    space;

  *|;

}%%

module CakeLang
  class Lexer
      CONVERSION = {
          :T_INT => :to_i,
          :T_FLOAT => :to_f
        }

      %% write data;

      # Lazy way of forwarding instance method calls used internally by Ragel to
      # their corresponding class methods.
      private_methods.grep(/^_lexer_/).each do |name|
        define_method(name) do
          return self.class.send(name)
        end

        private(name)
      end

      def initialize
        reset
      end

      def reset
        @data     = nil
        @ts       = nil
        @te       = nil
        @tokens   = []
       end

      def emit(symbol)
        # @ts, @te -> token start, token end
        # had to use @te-1 for token range end because 1 digit token (eg.: ',(,),+) and no whitespace between will 
        # break the tokenization
        value = @data[@ts..(@te-1)].pack("U*").strip

        if symbol.eql?(:T_INT) or symbol.eql?(:T_FLOAT)
          value = value.send(CONVERSION[symbol])
        end

        @tokens << [symbol, value]
      end

      def lex(data)
        @data = data.unpack("c*")
        lexer_start = self.class.lexer_start
        eof = data.length

        %% write init;
        %% write exec;

        tokens = @tokens

        reset

        return tokens
      end
  end
end
