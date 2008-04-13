# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'
ensure_in_path 'lib'
require 'jruby_gst'

task :default => 'spec:run'

PROJ.name = 'jruby_gst'
PROJ.authors = 'LeonB'
PROJ.email = 'leon@tim-online.nl'
PROJ.url = 'www.vanutsteen.nl'
PROJ.rubyforge_name = 'jruby_gst'
#PROJ.dependencies = ['rubygems']  
PROJ.version = File.read 'Version.txt'
PROJ.exclude = %w(.git pkg nbproject doc/)  

PROJ.spec_opts << '--color'

# EOF
