# Representor

[![Build Status](http://img.shields.io/travis/the-hypermedia-project/representor-ruby/master.svg?style=flat)](https://travis-ci.org/the-hypermedia-project/representor-ruby)
[![Code Climate](https://codeclimate.com/github/the-hypermedia-project/representor-ruby/badges/gpa.svg)](https://codeclimate.com/github/the-hypermedia-project/representor-ruby)
[![Test Coverage](https://codeclimate.com/github/the-hypermedia-project/representor-ruby/badges/coverage.svg)](https://codeclimate.com/github/the-hypermedia-project/representor-ruby)

Making the generation and consumption of Hypermedia messages for multiple media types accessible to the Ruby masses.

Implements the [Representor Pattern][] in Ruby.

Outlines a base interface for a hypermedia resource object. The interfaces of the sample classes are not
comprehensive, but rather expose the initial interface from a ruby standpoint and some other design concepts of
how to use builders and some of the internal constructs.

* [Representor](lib/representor.rb)
* [Representor::RepresentorBuilder](lib/representor/representor_builder.rb)
* [Representor::Transition](lib/representor/transition.rb)
* [Representor::TransitionBuilder](lib/representor/transition_builder.rb)
* [Representor::Transition::InputProperty](lib/representor/transition/input_property.rb)

## Testing

    $ rspec

[Representor Pattern]: https://github.com/the-hypermedia-project/charter#representor-pattern
