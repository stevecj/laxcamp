# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# TODO: Fix above.

# Development Notes

# ActionCable Or Not ActionCable

I created this project in Rails 5.0.0.rc1 with the intention of using
ActionCable, which I have not tried to use before. I still _might_ try
that later, but I have run into some issues that have lead me to not try
it up front.

1. I very much prefer TDD, and it is not yet clear to me how to test
   ActionCable channels. It looks like Rails might have some provision for
   that which I have hidden from myself by choosing to use rspec-rails.
2. It seems more sensible to maintain one API rather than 2, and it's not
   clear to me that WebSockets makes a good foundation for a universal
   API (not just for js in a browser).

For now, I'll use client-pull with an API inspired by
https://tools.ietf.org/html/rfc5005 (Feed Paging and Archiving).
