holmes-web
==========

Web dashboard for holmes.

Requirements
------------

The holmes-web requires the following tools to work:

* ruby
* rvm
* node
* npm
* bower (npm install -g bower)
* grunt (npm install grunt)
* grunt-cli (npm install -g grunt-cli)

Pre-installation
----------------

Setup your rvm according to your ruby version, i.e:

    rvm use 2.1.1

Add in your /etc/hosts:

    127.0.0.1   local.holmes.com


Installation
------------

To install just type:

    make setup

To run:

    make run

To test:

    make unit
