class Gst::Element
  attr_accessor :java_element
  
  #def initialize(factory_name, name)
  def initialize()
    #TODO: based on the factory_name create a specific objet? For example filesrc?
    
    #self.java_element = JavaGst::ElementFactory.make(factory_name, name)
    #self.java_element = JavaGst::Element.new()
  end
  
  #This one is only for inputrc
  def location=(location)
    self.java_element.location = location
  end
  
  #This one is only for capsfilter
  def set_caps(caps)
    return false if not caps.is_a? Gst::Caps
    
    self.java_element.set_caps(caps.java_caps)
  end
  
  def >>(another_element)
    #TODO: dit moet misschien net allemaal andersom?
    self.java_element.link(another_element.java_element)
    return another_element
  end
  
  def self.link_many(*elements)
    
    elements.each_with_index do |element, i|
      break if i+1 == elements.length
      next_element = elements[i+1]
      
      element >> next_element
    end
  end
  
end