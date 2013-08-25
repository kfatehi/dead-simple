#!/usr/bin/env bash
echo "Hit up http://localhost:5000/examples/ to learn EaselJS"
ruby -run -e httpd -- -p 5000 bower_components/easeljs
