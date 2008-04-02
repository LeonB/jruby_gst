class Gst::State
  #The states are now: ["NULL", "READY", "PLAYING", "SIGNALS", "PAUSED"]
  
  attr_accessor :state
  
  def self.all
    JavaGst::State.constants.grep(/^[A-Z]*$/)
  end
  
  def initialize(state)
    self.state = state
  end
  
  def to_s
    self.state.to_s
  end
  
  def to_java
    eval("JavaGst::State::#{state.to_s}")
  end

  Gst::State.all.each do |state|
    const_set state, Gst::State.new(state)
  end
end