require 'geminabox'

local_gem_list = Marshal.load(File.read('bench/local_gem_list_activemodel'))
remote_gem_list = Marshal.load(File.read('bench/remote_gem_list_activemodel'))

started = Time.now
combined_gem_list = Geminabox::GemListMerge.from(local_gem_list, remote_gem_list)
elaspsed = Time.now - started
puts "#{elaspsed.to_f} sec"

# expected = Marshal.load(File.read('bench/combined_gem_list_activemodel'))
# puts combined_gem_list == expected
