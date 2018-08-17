#!/usr/bin/env rackup
# encoding: utf-8
require_relative 'config/boot'
require File.dirname(__FILE__) + '/app'

run App
