class Gst::Element
  attr_accessor :java_element
  
  def initialize(factory_name, name)
    #TODO: based on the factory_name create a specific objet? For example filesrc?
    raise 'Gst.init must be called before creating an element!' if not Gst.initialized?
    
    self.java_element = JavaGst::ElementFactory.make(factory_name, name)
  end
  
  def location=(location)
    self.java_element.location = location
  end
  
  def >>(another_element)
    #TODO: dit moet misschien net allemaal andersom?
    self.java_element.link(another_element.java_element)
    return another_element
  end
end