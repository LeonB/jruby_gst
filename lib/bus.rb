class Gst::Bus < Gst::Element
  
  def initialize(pipeline)
    self.java_element = pipeline.java_element.get_bus()
  end 
end