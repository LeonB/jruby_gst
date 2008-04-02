class Gst::ElementFactory
  def self.make(factory_name, name)
    Gst::Element.new(factory_name, name)
  end
end