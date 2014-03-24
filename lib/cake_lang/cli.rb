module CakeLang
  module CLI
    class << self
      # Handle unavailable methods
      # @param [String] name [called Methodname]
      # @param [Array] *args [Available args]
      def method_missing(name, *args)
        puts "Command #{name} not available"
        print "Available Commands are: \n\n"
        self.methods(false).each do |method|
          print "\t #{method}\n" unless method == :method_missing
        end
        print "\n"
      end

      def compile(args)
        file = args[0]
        option = args[1]

        input = ""
        input_array = []
        tokens = []

        File.open(file, "r") do |f|
          input = f.read
        end

        tokens = CakeLang::Lexer.new.lex(input.strip)
        if option.eql?('--debug')
          puts "Tokenized input:\n"
          puts "#{tokens.inspect}\n\n"
        end

        ast = CakeLang::Parser.new.parse(tokens.dup)
        if option.eql?('--debug')
          puts "Abstract Syntax Tree:\n"
          puts "#{ast.inspect}\n\n"
        end

        code = CakeLang::CodeGenerator::C.compile(ast)
        if option.eql?('--debug')
          puts "Generated Code:\n"
          puts "#{code.inspect}\n\n"
        end

        @filename = file.split('.')[0]
        system("echo '#{code}' > #{@filename}.c")
        system("gcc -o #{@filename} #{@filename}.c")
      end

      def run(args)
        compile(args)
        system("./#{@filename}")
      end
    end
  end
end

