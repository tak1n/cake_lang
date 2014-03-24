
# line 1 "lib/cake_lang/lexer.rl"

# line 98 "lib/cake_lang/lexer.rl"


module CakeLang
  class Lexer
      CONVERSION = {
          :T_INT => :to_i,
          :T_FLOAT => :to_f
        }

      
# line 16 "lib/cake_lang/lexer.rb"
class << self
	attr_accessor :_lexer_trans_keys
	private :_lexer_trans_keys, :_lexer_trans_keys=
end
self._lexer_trans_keys = [
	0, 0, 48, 57, 45, 45, 
	65, 122, 65, 122, 9, 
	122, 48, 57, 46, 57, 
	48, 62, 65, 122, 65, 122, 
	65, 122, 65, 122, 65, 
	122, 0
]

class << self
	attr_accessor :_lexer_key_spans
	private :_lexer_key_spans, :_lexer_key_spans=
end
self._lexer_key_spans = [
	0, 10, 1, 58, 58, 114, 10, 12, 
	15, 58, 58, 58, 58, 58
]

class << self
	attr_accessor :_lexer_index_offsets
	private :_lexer_index_offsets, :_lexer_index_offsets=
end
self._lexer_index_offsets = [
	0, 0, 11, 13, 72, 131, 246, 257, 
	270, 286, 345, 404, 463, 522
]

class << self
	attr_accessor :_lexer_indicies
	private :_lexer_indicies, :_lexer_indicies=
end
self._lexer_indicies = [
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 0, 2, 3, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 3, 
	3, 3, 3, 4, 3, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 3, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 3, 3, 3, 3, 4, 3, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 5, 4, 4, 4, 4, 
	4, 4, 3, 6, 6, 6, 6, 6, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 6, 3, 7, 3, 3, 8, 
	3, 3, 9, 10, 11, 12, 13, 14, 
	3, 15, 16, 16, 16, 16, 16, 16, 
	16, 16, 16, 16, 3, 3, 17, 18, 
	3, 3, 3, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 3, 3, 3, 
	20, 3, 3, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 21, 19, 19, 
	19, 19, 19, 19, 19, 3, 16, 16, 
	16, 16, 16, 16, 16, 16, 16, 16, 
	22, 24, 23, 16, 16, 16, 16, 16, 
	16, 16, 16, 16, 16, 23, 16, 16, 
	16, 16, 16, 16, 16, 16, 16, 16, 
	25, 25, 25, 25, 26, 25, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	27, 27, 27, 27, 4, 27, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	27, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 28, 28, 28, 28, 4, 
	28, 4, 4, 4, 29, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 28, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 28, 28, 
	28, 28, 4, 28, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 30, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 28, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 28, 28, 28, 28, 4, 28, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 31, 4, 4, 4, 4, 
	4, 28, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 28, 28, 28, 28, 
	4, 28, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 32, 4, 4, 
	4, 4, 4, 4, 28, 0
]

class << self
	attr_accessor :_lexer_trans_targs
	private :_lexer_trans_targs, :_lexer_trans_targs=
end
self._lexer_trans_targs = [
	5, 5, 5, 0, 9, 10, 5, 5, 
	5, 5, 5, 5, 6, 5, 8, 5, 
	7, 2, 5, 3, 5, 4, 5, 5, 
	1, 5, 5, 5, 5, 11, 12, 13, 
	9
]

class << self
	attr_accessor :_lexer_trans_actions
	private :_lexer_trans_actions, :_lexer_trans_actions=
end
self._lexer_trans_actions = [
	1, 2, 3, 0, 4, 0, 7, 8, 
	9, 10, 11, 12, 0, 13, 0, 14, 
	15, 0, 16, 0, 17, 0, 18, 19, 
	0, 20, 21, 22, 23, 0, 0, 0, 
	24
]

class << self
	attr_accessor :_lexer_to_state_actions
	private :_lexer_to_state_actions, :_lexer_to_state_actions=
end
self._lexer_to_state_actions = [
	0, 0, 0, 0, 0, 5, 0, 0, 
	0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_lexer_from_state_actions
	private :_lexer_from_state_actions, :_lexer_from_state_actions=
end
self._lexer_from_state_actions = [
	0, 0, 0, 0, 0, 6, 0, 0, 
	0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_lexer_eof_trans
	private :_lexer_eof_trans, :_lexer_eof_trans=
end
self._lexer_eof_trans = [
	0, 1, 0, 0, 0, 0, 23, 24, 
	26, 28, 29, 29, 29, 29
]

class << self
	attr_accessor :lexer_start
end
self.lexer_start = 5;
class << self
	attr_accessor :lexer_first_final
end
self.lexer_first_final = 5;
class << self
	attr_accessor :lexer_error
end
self.lexer_error = 0;

class << self
	attr_accessor :lexer_en_main
end
self.lexer_en_main = 5;


# line 108 "lib/cake_lang/lexer.rl"

      # Lazy way of forwarding instance method calls used internally by Ragel to
      # their corresponding class methods.
      private_methods.grep(/^_lexer_/).each do |name|
        define_method(name) do
          return self.class.send(name)
        end

        private(name)
      end

      def emit(symbol, data, tokens, ts, te)
        value = data[ts..te].pack("U*").strip

        if symbol.eql?(:T_INT) or symbol.eql?(:T_FLOAT)
          value = value.send(CONVERSION[symbol])
        end

        tokens << [symbol, value]
      end

      def lex(data)
        data = data.unpack("U*")
        lexer_start = self.class.lexer_start
        eof = data.length
        tokens = []

        
# line 227 "lib/cake_lang/lexer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = lexer_start
	ts = nil
	te = nil
	act = 0
end

# line 136 "lib/cake_lang/lexer.rl"
        
# line 239 "lib/cake_lang/lexer.rb"
begin
	testEof = false
	_slen, _trans, _keys, _inds, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	case _lexer_from_state_actions[cs] 
	when 6 then
# line 1 "NONE"
		begin
ts = p
		end
# line 267 "lib/cake_lang/lexer.rb"
	end
	_keys = cs << 1
	_inds = _lexer_index_offsets[cs]
	_slen = _lexer_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_lexer_trans_keys[_keys] <= data[p].ord && 
			data[p].ord <= _lexer_trans_keys[_keys + 1] 
		    ) then
			_lexer_indicies[ _inds + data[p].ord - _lexer_trans_keys[_keys] ] 
		 else 
			_lexer_indicies[ _inds + _slen ]
		 end
	end
	if _goto_level <= _eof_trans
	cs = _lexer_trans_targs[_trans]
	if _lexer_trans_actions[_trans] != 0
	case _lexer_trans_actions[_trans]
	when 15 then
# line 1 "NONE"
		begin
te = p+1
		end
	when 21 then
# line 26 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_KEYWORD_DEF, data, tokens, ts, te)
     end
		end
	when 3 then
# line 30 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_KEYWORD_END, data, tokens, ts, te)
     end
		end
	when 8 then
# line 38 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_DQUOTE, data, tokens, ts, te)
     end
		end
	when 2 then
# line 46 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_FLOAT, data, tokens, ts, te)
     end
		end
	when 12 then
# line 62 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_MUL, data, tokens, ts, te)
     end
		end
	when 14 then
# line 66 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_DIV, data, tokens, ts, te)
     end
		end
	when 17 then
# line 70 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_EXP, data, tokens, ts, te)
     end
		end
	when 9 then
# line 74 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_MOD, data, tokens, ts, te)
     end
		end
	when 10 then
# line 78 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_LBR, data, tokens, ts, te)
     end
		end
	when 11 then
# line 82 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_RBR, data, tokens, ts, te)
     end
		end
	when 16 then
# line 86 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_EQ, data, tokens, ts, te)
     end
		end
	when 13 then
# line 90 "lib/cake_lang/lexer.rl"
		begin
te = p+1
 begin 
      emit(:T_COL, data, tokens, ts, te)
     end
		end
	when 7 then
# line 94 "lib/cake_lang/lexer.rl"
		begin
te = p+1
		end
	when 19 then
# line 42 "lib/cake_lang/lexer.rl"
		begin
te = p
p = p - 1; begin 
      emit(:T_INT, data, tokens, ts, te)
     end
		end
	when 23 then
# line 50 "lib/cake_lang/lexer.rl"
		begin
te = p
p = p - 1; begin 
      emit(:T_LITERAL, data, tokens, ts, te)
     end
		end
	when 18 then
# line 54 "lib/cake_lang/lexer.rl"
		begin
te = p
p = p - 1; begin 
      emit(:T_ADD, data, tokens, ts, te)
     end
		end
	when 20 then
# line 58 "lib/cake_lang/lexer.rl"
		begin
te = p
p = p - 1; begin 
      emit(:T_SUB, data, tokens, ts, te)
     end
		end
	when 1 then
# line 42 "lib/cake_lang/lexer.rl"
		begin
 begin p = ((te))-1; end
 begin 
      emit(:T_INT, data, tokens, ts, te)
     end
		end
	when 22 then
# line 1 "NONE"
		begin
	case act
	when 3 then
	begin begin p = ((te))-1; end

      emit(:T_KEYWORD_OUT, data, tokens, ts, te)
    end
	when 7 then
	begin begin p = ((te))-1; end

      emit(:T_LITERAL, data, tokens, ts, te)
    end
end 
			end
	when 24 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 34 "lib/cake_lang/lexer.rl"
		begin
act = 3;		end
	when 4 then
# line 1 "NONE"
		begin
te = p+1
		end
# line 50 "lib/cake_lang/lexer.rl"
		begin
act = 7;		end
# line 463 "lib/cake_lang/lexer.rb"
	end
	end
	end
	if _goto_level <= _again
	case _lexer_to_state_actions[cs] 
	when 5 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 473 "lib/cake_lang/lexer.rb"
	end

	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _lexer_eof_trans[cs] > 0
		_trans = _lexer_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 137 "lib/cake_lang/lexer.rl"

        tokens
      end
  end
end
