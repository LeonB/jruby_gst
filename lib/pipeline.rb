class Gst::Pipeline < Gst::Element
  attr_accessor :java_pipeline
  attr_reader :bus
  
  def initialize(name)
    self.java_pipeline = JavaGst::Pipeline.new(name)
  end
  
  def add(*elements)
    java_elements = elements.collect { |element| element.java_element }
    java_elements = java_elements.to_java(:java.org.gstreamer::Element)
    java_pipeline.add_many(java_elements)
  end
  
  def bus
    @bus ||= Gst::Bus.new(self)
  end
  
  def play
    java_pipeline.play
  end
  
  def pause
    java_pipeline.pause
  end
  
  def stop
    java_pipeline.stop
  end
  
end