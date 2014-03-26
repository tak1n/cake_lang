module CakeLang
  module CodeGenerator
    class Ruby
      class << self
        def compile(ast, file)
          @file = RubyFile.new
          @compiled = ""

          if ast.first.eql?(:block)
            stmts = ast[1]
            compile_stmts(stmts)
          else
            fail "Expected program AST"
          end

          puts @compiled.inspect

          @file.serve(file)
        end

        def compile_stmts(stmts)
          if stmts.first.eql?(:stmts)
            stmts.each do |stmt|
              next if stmt.eql?(:stmts)
              @compiled += compile_stmt(stmt)
            end
          elsif stmts.first.eql?(:stmt)
            @compiled += compile_stmt(stmts)
          end
        end

        def compile_stmt(stmt)
          stmt = stmt[1]
          return if stmt.eql?(nil)
          allowed = [:defn, :call, :equal, :op, :block]

          if allowed.include?(stmt.first)
            case stmt.first
            when :defn
              return compile_defn(stmt)
            when :call
              return compile_call(stmt)
            when :equal
              return compile_equal(stmt)
            when :op
              return compile_op(stmt)
            else
              fail "Error? #{stmt.first}"
            end
          else
            fail "Not allowed Statment #{stmt.first}"
          end
        end

        def compile_defn(sub)
          methodid = sub[1]
          args = sub[2]
          methodblock = block(sub[3])

          defstring = "def #{methodid}(#{method_args(args)})\n"
          defstring += "  #{methodblock}\n"
          defstring += "end\n"

          return defstring
        end

        def method_args(args)
          argarray = []
          args.each do |arg|
            next if arg.eql?(:arglist)

            argarray << arg[1]
          end

          argarray.join(',')
        end

        def block(block)
          if block.first.eql?(:block)
            return compile_stmts(block[1])
          else
            fail "Expected block AST"
          end
        end

        def compile_equal(sub)
          eqid = sub[1][1]
          rhs = compile_op(sub[2])
          equalstring = "#{eqid} = #{rhs}"

          return equalstring
        end

        def compile_op(sub)
          operation_table = {
            add: '+',
            sub: '-',
            mul: '*',
            div: '/',
            exp: '**',
            mod: '%'
          }

          if sub.first.eql?(:op)
            operation = operation_table[sub[1][0]]
            opstring = "#{sub[1][1][1]} #{operation} #{sub[1][2][1]}"
          else
            fail "Expected op AST"
          end
        end

        def compile_call(sub)
          if sub.first.eql?(:call)
            callid = sub[1]
            args = sub[2]

            callstring = "#{callid}(#{method_args(args)})"

            return callstring
          else
            fail "Expected call AST"
          end
        end
      end
    end

    class RubyFile
      def initialize
        @body = "#!/usr/bin/env ruby\n"
      end

      def add(string)
        @body += string
      end

      def serve(file)
        name = file.split('.')[0]

        system("echo '#{@body}' > #{name}")
        system("chmod +x #{name}")
      end
    end
  end
end
