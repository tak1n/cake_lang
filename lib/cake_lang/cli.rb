filename = ARGV[0].split('.')[0]

input = ""
input_array = []
tokens = []

File.open(ARGV[0], "r") do |f|
  input = f.read
end

tokens = CakeLang::Lexer.new.lex(input.strip)

puts "Tokenized input:\n"
puts "#{tokens.inspect}\n\n"

ast = CakeLang::Parser.new.parse(tokens)

puts "Abstract Syntax Tree:\n"
puts "#{ast.inspect}\n\n"

code = CakeLang::CodeGenerator::C.compile(ast)

puts "Generated Code:\n"
puts "#{code.inspect}\n\n"

system("echo '#{code}' > #{filename}.c")
system("gcc -o #{filename} #{filename}.c")