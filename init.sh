#!/bin/bash
rake db:migrate
rake test
bundle exec rails s -p 3000 -b '0.0.0.0'
