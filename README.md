Overview
========

The default 'gem outdated' considers *all* gems. For large gemsets this means that:
1. it takes some time
2. it can produce a long list of gems

A quick check for a specific gem is not easy in this way.
This gem tries to solve this by letting the command accept a string (like the search-command).

Usage
-----

    $> gem outdated rspec
    rspec (2.4.0 < 2.5.0)
    rspec-core (2.4.0 < 2.5.1)
    rspec-expectations (2.4.0 < 2.5.0)
    rspec-mocks (2.4.0 < 2.5.0)
    rspec-rails (2.4.1 < 2.5.0)

    $> gem outdated ^rspec$
    rspec (2.4.0 < 2.5.0)


Installation
------------

### [RubyGems](http://rubygems.org/)

    $ gem install gem-outdated

Author
------

Gert Goet (eval) :: gert@thinkcreate.nl :: @gertgoet
