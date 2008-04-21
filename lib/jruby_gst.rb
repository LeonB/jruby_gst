include Java
libdir = File.expand_path(File.dirname(__FILE__))
require "#{libdir}/../ext/gstreamer-java-0.7.jar"

module JavaGst
  include_package 'org.gstreamer'
  include_package 'org.gstreamer.elements'
end

required_files = [
  'gst',
  'element',
  'pipeline',
  'bin',
  'playbin',
  'bus',
  'message',
  'messagetype',
  'state',
  'elementfactory',
  'tag',
  'caps',
  'videocomponent',
  'metaid',
  'monkeys',
  #'activesupport'
]

require 'rubygems'
required_files.each { |file| load "#{libdir}/#{file}.rb" }

#Some notitios:
#  Almost everything inherits from Gst::Element. So every link to the java element is a java_element
#  No need to add more java_'s, because java-gstreamer already does that for us!
