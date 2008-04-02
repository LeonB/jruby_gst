include Java
require '/home/leon/src/gstreamer-java/trunk/dist/gstreamer-java.jar'

module JavaGst
  include_package 'org.gstreamer'
end

libdir = File.expand_path(File.dirname(__FILE__) + "/lib")

required_files = [
  'gst',
  'element',
  'pipeline',
  'bin',
  'playbin',
  'bus',
  'message',
  'messagetype',
  'elementfactory',
  #'activesupport'
]

require 'rubygems'
require 'activesupport'
required_files.each { |file| load "#{libdir}/#{file}.rb" }