# GameOfLife

This gem is an implementation of conway's game of life

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'conways_game_of_life'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conways_game_of_life
    $ game_of_life width:5 height:5 seed_probability:0.5 speed:1

## Usage

```
$ gem install conways_game_of_life
$ irb
irb(main):001:0> require 'game_of_life'
=> true

irb(main):002:0> game = GameOfLife::Earth.new(5,5,0.5)
=> #<GameOfLife::Earth:0x0055cf7f21a170 @generation=1, @width=5, @height=5, @cells=[[#<GameOfLife::Cell:0x0055cf7f219f18 @alive=true>, #<GameOfLife::Cell:0x0055cf7f219ef0 @alive=true>, #<GameOfLife::Cell:0x0055cf7f219db0 @alive=false>, #<GameOfLife::Cell:0x0055cf7f2198b0 @alive=false>, #<GameOfLife::Cell:0x0055cf7f2194a0 @alive=true>], [#<GameOfLife::Cell:0x0055cf7f218f50 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218f00 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218eb0 @alive=true>, #<GameOfLife::Cell:0x0055cf7f218d98 @alive=true>, #<GameOfLife::Cell:0x0055cf7f218cf8 @alive=false>], [#<GameOfLife::Cell:0x0055cf7f218c80 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218c08 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218a50 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218a00 @alive=true>, #<GameOfLife::Cell:0x0055cf7f2188e8 @alive=true>], [#<GameOfLife::Cell:0x0055cf7f218820 @alive=false>, #<GameOfLife::Cell:0x0055cf7f2187d0 @alive=false>, #<GameOfLife::Cell:0x0055cf7f2187a8 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218730 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218640 @alive=true>], [#<GameOfLife::Cell:0x0055cf7f2183e8 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218398 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218208 @alive=false>, #<GameOfLife::Cell:0x0055cf7f218118 @alive=true>, #<GameOfLife::Cell:0x0055cf7f218050 @alive=true>]]>

irb(main):003:0> game.log
=> "Generation 1\n1 | 1 | 0 | 0 | 1\n0 | 0 | 1 | 1 | 0\n0 | 0 | 0 | 1 | 1\n0 | 0 | 0 | 0 | 1\n0 | 0 | 0 | 1 | 1\n"

irb(main):004:0> puts game.log
Generation 1
1 | 1 | 0 | 0 | 1
0 | 0 | 1 | 1 | 0
0 | 0 | 0 | 1 | 1
0 | 0 | 0 | 0 | 1
0 | 0 | 0 | 1 | 1
=> nil

irb(main):005:0> game.next!
=> nil

irb(main):006:0> puts game.log
Generation 2
0 | 1 | 0 | 0 | 0
0 | 0 | 1 | 0 | 1
0 | 0 | 0 | 0 | 1
0 | 0 | 0 | 1 | 0
0 | 0 | 0 | 1 | 1
=> nil

```


```

$ git clone https://github.com/aravind99/conways_game_of_life.git 
$ cd game_of_life
$ bin/game_of_life width:6 height:6 seed_probability:0.5 speed:1  

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Aravind99/game_of_life.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
