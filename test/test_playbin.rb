#!/usr/bin/env jruby

load '/home/leon/Workspaces/jruby_gst/lib/jruby_gst.rb'

class Player
  attr_accessor :playlist, :playbin, :current_track
  
  def initialize
    Gst.init('rmpd')
    
    self.playbin = Gst::Playbin.new('rmpd')
    playbin.bus.connect(Gst::MessageType::EOS) do |message|
      #playbin.state = Gst
      playbin.state = Gst::State::NULL
      self.play_next_track
      print "#{message.inspect}\n"
    end
    
    playbin.bus.connect(Gst::MessageType::ERROR) do |error|
      print "I got an error: #{error.inspect}\n"
    end
    
    playlist << "/home/leon/Downloads/nog_te_bewerken/coin.wav"
    playlist << "/usr/share/sounds/error.wav"
    playlist << "/usr/share/sounds/phone.wav"
    playlist << "/home/leon/Music/Bennie Hek & De Houdoe's/Mega Melige Zeebra-Rock/Bennie Hek & De Houdoe's - Mega Melige Zeebra-Rock - 01 - Intro.mp3"
  end
  
  def playlist
    return @playlist ||= []
  end
  
  def play
    (playbin.paused?) ? playbin.play : play_track(0)
  end
  
  def play_track(n)
      unless playlist.empty?
        self.current_track = playlist[n].to_s
        self.playbin.file = playlist[n]
        self.playbin.play
        playlist.delete_at(n)
      else 
        self.stop()
      end
  end
  
  def play_next_track
    play_track(0)
  end
  
  def pause
    playbin.pause
  end
  
  def stop
    self.current_track = nil
    playbin.stop
    Gst.quit() #If you wanna quit
    Gst.deinit()
  end
end

#Now play!
p = Player.new
p.play

while p.current_track do
  print "waiting...\n"
  print "#{p.current_track}\n"
  sleep 2
end
