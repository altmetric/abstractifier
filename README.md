# Abstractifier [![Build Status](https://travis-ci.org/altmetric/abstractifier.svg?branch=master)](https://travis-ci.org/altmetric/abstractifier)

Builds a short abstract of a supplied text by extracting the first couple of
sentences and trimming off punctuation etc.

## Usage

### Basic usage

```ruby
require 'abstractifier'

abstractifier = Abstractifier.new
#=> #<Abstractifier:0x007ffe350993c8 @elider="…", @max_length=250, @min_length=80>

abstractifier.abstractify("This is a longish piece of text. It contains several sentences. It is long enough that we will need to build an abstract for it, but the first two sentences are quite short, so we will need to include some content from the third sentence so that we can fulfill both our minimum and maximum abstract lengths.")
#=> "This is a longish piece of text. It contains several sentences. It is long enough that we will need to build an abstract for it, but the first two sentences are quite short, so we will need to include some content from the third sentence so that we…"
```

It's possible to set minimum and maximum lengths on the abstract

```ruby
abstractifier = Abstractifier.new(max: 100, min: 20)
#=> #<Abstractifier:0x007fca72d64040 @elider="…", @max_length=100, @min_length=20>

abstractifier.abstractify("This abstract should be much shorter. It should only include the first sentence.")
#=> "This abstract should be much shorter."
```

We can also change the character used to elide sentences (though I don't really know why you'd do this)

```ruby
abstractifier = Abstractifier.new(max: 30, min: 20, elider: '!!!')
#=> #<Abstractifier:0x007fca72d64040 @elider="!!!", @max_length=100, @min_length=30>

abstractifier.abstractify("This abstract should be much shorter but long enough that we have to truncate the sentence in the middle")
#=> "This abstract should be much!!!"
```


## License

Copyright © 2015 Altmetric LLP

Distributed under the MIT License.
