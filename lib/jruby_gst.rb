include Java
require '/home/leon/src/gstreamer-java/trunk/dist/gstreamer-java.jar'

module JavaGst
  include_package 'org.gstreamer'
  include_package 'org.gstreamer.elements'
end

libdir = File.expand_path(File.dirname(__FILE__))

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
