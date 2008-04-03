class Gst::Pipeline < Gst::Element
  attr_reader :bus
  
  def initialize(name)
    self.java_element = JavaGst::Pipeline.new(name)
  end
  
  def add(*elements)
    java_elements = elements.collect { |element| element.java_element }
    java_elements = java_elements.to_java(:java.org.gstreamer::Element)
    java_element.add_many(java_elements)
  end
  
  def bus
    @bus ||= Gst::Bus.new(self)
  end
  
  def play
    java_element.play
  end
  
  def pause
    java_element.pause
  end
  
  def paused?
    self.state == Gst::State::PAUSED
  end
  
  def playing?
    self.state == Gst::State::PLAYING
  end
  
  def stop
    java_element.stop
  end
  
  def stopped?
    self.state == Gst::State::NULL
  end
  
  def state
    state = java_element.state
    eval("Gst::State::#{state.to_s}")
  end
  
  def state=(state)
    return false if not state.is_a? Gst::State
    
    java_element.set_state(state.to_java)
  end
  
end