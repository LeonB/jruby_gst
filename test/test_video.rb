#Copied it from http://code.google.com/p/gstreamer-java/wiki/VideoTestTutorial
load '../lib/jruby_gst.rb'

class VideoTest
  def initialize(args)
    args = Gst.init("VideoTest", args)
    pipe = Gst::Pipeline.new("VideoTest")
    videosrc = Gst::ElementFactory.make("videotestsrc", "source")
    videofilter = Gst::ElementFactory.make("capsfilter", "filter")
    videofilter.set_caps(Gst::Caps.from_string("video/x-raw-yuv, width=720, height=576" \
          + ", bpp=32, depth=32, framerate=25/1"))
    
    SwingUtilities.invokeLater do
      videoComponent = VideoComponent.new
      videosink = videoComponent.get_element
      pipe.add_many(videosrc, videofilter, videosink)
      Element.link_many(videosrc, videofilter, videosink)
                
      #Now create a JFrame to display the video output
      frame = JFrame.new("Swing Video Test")
      frame.set_default_close_operation(JFrame.EXIT_ON_CLOSE);
      frame.add(videoComponent, BorderLayout.CENTER);
      videoComponent.set_preferred_size(Dimension.new(720, 576))
      frame.pack()
      frame.setVisible(true)
                
      #Start the pipeline processing
      pipe.setState(State.PLAYING)
    end
  end
end

VideoTest.new(ARGV)