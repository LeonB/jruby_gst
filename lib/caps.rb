class Gst::Caps
  attr_accessor :java_caps
  
  def initialize(capabilities = nil)
    self.java_caps = JavaGst::Caps.new(capabilities)
  end
  
  def self.from_string(capabilities)
    Gst::Caps.new(capabilities)
  end
end