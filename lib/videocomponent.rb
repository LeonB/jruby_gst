module Gst::Swing
  
  class VideoComponent
    attr_accessor :java_videocomponent 
  
    def initialize
      self.java_videocomponent = org.gstreamer.swing.VideoComponent.new
    end
  
    def get_element
      java_element = self.java_videocomponent.getElement()
      #rgb = Gst::ElementFactory.make('rgbdatasink')
      rgb = Gst::Element.new
      rgb.java_element = java_element
      return rgb
    end
  end
end