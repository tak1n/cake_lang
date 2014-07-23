%%machine lexer;

module CakeLang
  class Lexer
    %% write data;

    CONVERSION = {
        :T_INT => :to_i,
        :T_FLOAT => :to_f
      }

    def initialize
      reset
    end

    def reset
      @data     = nil
      @ts       = nil
      @te       = nil
      @tokens   = []
    end

    # @ts, @te -> token start, token end
    # had to use @te-1 for token range end because 1 digit token (eg.: ',(,),+) and no whitespace between will 
    # break the tokenization
    def data(start = @ts, stop = (@te-1))
      return @data[start..stop].pack('U*')
    end

    def emit(symbol, start = @ts, stop = (@te-1))
      value = data(start, stop)

      if symbol.eql?(:T_INT) or symbol.eql?(:T_FLOAT)
        value = value.send(CONVERSION[symbol])
      end

      @tokens << [symbol, value]
    end

    def lex(data)
      @data = data.unpack("U*")
      lexer_start = self.class.lexer_start
      eof = data.length

      _lexer_eof_trans          = self.class.send(:_lexer_eof_trans)
      _lexer_from_state_actions = self.class.send(:_lexer_from_state_actions)
      _lexer_index_offsets      = self.class.send(:_lexer_index_offsets)
      _lexer_indicies           = self.class.send(:_lexer_indicies)
      _lexer_key_spans          = self.class.send(:_lexer_key_spans)
      _lexer_to_state_actions   = self.class.send(:_lexer_to_state_actions)
      _lexer_trans_actions      = self.class.send(:_lexer_trans_actions)
      _lexer_trans_keys         = self.class.send(:_lexer_trans_keys)
      _lexer_trans_targs        = self.class.send(:_lexer_trans_targs)

      %% write init;
      %% write exec;

      tokens = @tokens

      reset

      return tokens
    end

    %%{
      access @;

      T_KEYWORD_DEF = '->';
      T_KEYWORD_END = '<-';
      T_KEYWORD_OUT = 'puts';
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

        T_KEYWORD_OUT => {
          emit(:T_KEYWORD_OUT)
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

        # any+ => {
          # emit(:UNKNOWN)
        # };

      *|;

    }%%
  end # Lexer
end # CakeLang
