class Gst::ElementFactory
  def self.make(factory_name, name = nil)
    #Gst::Element.new(factory_name, name)
    gst_element = Gst::Element.new
    gst_element.java_element = JavaGst::ElementFactory.make(factory_name, name)
    return gst_element
  end
end