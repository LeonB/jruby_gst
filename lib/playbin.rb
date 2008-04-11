class Gst::Playbin < Gst::Pipeline
  attr_accessor :file
  
  def initialize(name = nil)
    self.java_element = JavaGst::PlayBin.new(name)
  end
  
  def play(file = nil)
    self.file = file if file
    super() #Call it with no arguments
  end
  
  def file=(file)
    @file = file
    file = java.io.File.new(file)
    self.java_element.set_input_file(file)
  end
  
  def volume
    self.java_element.get_volume_percent  
  end
  
  def volume=(volume)
    self.java_element.set_volume_percent(volume)
  end
end