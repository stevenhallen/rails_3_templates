rails_3_templates
=================

Templates we use, to build Rails projects at Steven H. Allen & Co. (http://stevenhallen.com)

The problem we want to solve:

We set up projects roughly the same for every rails app, so we want to automate that as cleanly as possible.  The improved Rails 3 templates have made it a lot easier to create and maintain rails app generation templates

Exceptions
==========

This template, at the moment, sets up the Rails application using PostreSQL


How to use these
================

Create a directory to store all of your rails projects:

$ mkdir ~/dev

Then enter that directory and generate a new rails app

$ cd ~/dev

$ rails new <rails_app_name> -m https://github.com/stevenhallen/rails_3_templates/raw/master/base.rb
-S -T -d postgresql

