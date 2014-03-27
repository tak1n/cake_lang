# CakeLang

Fun Language for learning lexing and parsing with ruby.

Lexer is implented as pure ruby lexer (lexer.old.rb) and as lexer via ragel in ruby host (lexer.rl)

Parser is implemented with racc (parser.y)

## Installation

    $ git clone git@github.com:Benny1992/cake_lang.git
    $ cd cake_lang
    $ rake install cake_lang

## Usage

A testfile is served in the sample folder.
After installing you can compile or run the file via:

    $ cake compile sample/test.cl

or

    $ cake run sample/test.cl

## Contributing

1. Fork it ( http://github.com/benny1992/cake_lang/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

