include Java
require '/home/leon/src/gstreamer-java/trunk/dist/gstreamer-java.jar'

$: << File.expand_path(File.dirname(__FILE__) + "/lib")

module JavaGst
  include_package 'org.gstreamer'
end

require 'gst'
require 'element'
require 'pipeline'
require 'bin'
require 'playbin'
require 'bus'
require 'message'
require 'messagetype'
require 'elementfactory'