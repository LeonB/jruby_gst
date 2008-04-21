#Based on code from Wayne Meissner
#This whole class is in gstreamer-java because I don't want the overhead of using jruby_gst.
#It would make a nice excercise though.

class Gst::Tag
  
  def self.from_uri(uri)
    #done = java.util.concurrent.CountDownLatch.new(1)
    $taglist = []
    $source = []
    
    Gst.init('tagfinder')
    pipe = JavaGst::PlayBin.new('tagfinder')
    pipe.setInputFile(java.io.File.new(uri))
    audio = JavaGst::ElementFactory.make("fakesink", "audio-sink")
    video = JavaGst::ElementFactory.make("fakesink", "video-sink")
    pipe.setAudioSink(audio)
    pipe.setVideoSink(video)
    
    pipe.getBus().connect(JavaGst::Bus::TAG.impl() do |method, source, taglist|
      print "TAG callback\n"
      print "method: #{method}\n"
      #$source << source
      $taglist << taglist
    end
    )
    
    audio.set("signal-handoffs", true)
    video.set("signal-handoffs", true)
    
    #As soon as the data starts to flow, it means all tags have been found
    handoff = JavaGst::Element::HANDOFF.impl do |element, buffer, pad|
      print "HANDOFF callback\n"
      
      pipe.setState(JavaGst::State::NULL)
      #done.countDown()
    end
    audio.connect(handoff)
    video.connect(handoff)
    
    #Start the pipeline playing
    pipe.setState(JavaGst::State::PAUSED);
    begin
      #done.await()
    rescue InterruptedException => ex
    end
    pipe.setState(JavaGst::State::NULL)
    
#    src = Gst::ElementFactory.make('filesrc', 'tagfinder')
#    src.location = uri
#    
#    src.bus.connect(Gst::MessageType::TAG) do |message|
#      print "#{message}\n"
#    end
    
  end
  
end