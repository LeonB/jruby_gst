#Copied it from http://code.google.com/p/gstreamer-java/wiki/VideoTestTutorial
load '../lib/jruby_gst.rb'
import javax.swing.JFrame
import java.awt.BorderLayout
import java.awt.Dimension

class VideoTest
  def initialize(args = [])
    args = Gst.init("VideoTest", args)
    pipe = Gst::Pipeline.new("VideoTest")
    videosrc = Gst::ElementFactory.make("videotestsrc", "source")
    videofilter = Gst::ElementFactory.make("capsfilter", "filter")
    
    videofilter.set_caps(Gst::Caps.from_string("video/x-raw-yuv, width=720, height=576" \
          + ", bpp=32, depth=32, framerate=25/1"))
    
    javax.swing.SwingUtilities.invokeLater Proc.new {
      videoComponent = Gst::Swing::VideoComponent.new
      videosink = videoComponent.get_element
      pipe.add(videosrc, videofilter, videosink)
      Gst::Element.link_many(videosrc, videofilter, videosink)
      
      #Now create a JFrame to display the video output
      frame = JFrame.new("Swing Video Test")
      frame.set_default_close_operation(JFrame::EXIT_ON_CLOSE)
      frame.add(videoComponent.java_videocomponent, BorderLayout::CENTER)
      videoComponent.java_videocomponent.set_preferred_size(Dimension.new(720, 576))
      frame.pack()
      frame.setVisible(true)
                
      #Start the pipeline processing
      pipe.state = Gst::State::PLAYING
    }
  end
end

VideoTest.new(ARGV)