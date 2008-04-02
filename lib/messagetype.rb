class Gst::MessageType
  attr_accessor :type
  
  def self.all
    types = JavaGst::MessageType.constants.grep(/^[A-Z]*$/)
    types << 'MESSAGE'
  end
  
  def initialize(type)
    self.type = type
  end
  
  def to_s
    self.type.to_s
  end

  Gst::MessageType.all.each do |type|
    const_set type, Gst::MessageType.new(type)
  end
end