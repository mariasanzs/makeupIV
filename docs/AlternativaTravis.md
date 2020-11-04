~~~
language: ruby

rvm:
  - 2.7.2

before-install:
  - gem install bundler
  - bundle install

script:
  - rake test
~~~
