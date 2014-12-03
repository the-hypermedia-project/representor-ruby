ROOT = Pathname.new(File.expand_path('../../', __FILE__))
$LOAD_PATH.unshift((ROOT + 'lib').to_s)

require 'bacon'
require 'hypermedia_resource'
require 'hypermedia_resource/transition'
