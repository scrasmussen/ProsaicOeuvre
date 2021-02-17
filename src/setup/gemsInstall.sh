#!/bin/bash

if ! command -v gem $> /dev/null
then
		echo "Install gem from https://rubygems.org/pages/download"
		exit
fi

set -x

gem update --system

{ set +x; } 2> /dev/null
echo "--------------------------------------------"
echo "-             Installing Gems              -"
echo "--------------------------------------------"
set -x

# gem install taskjuggler
