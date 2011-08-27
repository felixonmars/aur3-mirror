#!/usr/bin/env ruby

#
# license: (new) BSD
#

VER='0.3'

require 'getoptlong'
require 'fileutils'

=begin

 ## known issues

  1. debug code on line 102-115 cannot be reached, only when
    @debug set to true in this file (not by --debug)

  2. force cannot be specified in config, but must be used as option
   (bug/feature?)

=end

#=====================================================================
# global config - defaults
#=====================================================================

@verbose = false
@debug = false
user = nil
force = false

@mkpath = false
@rotate = false
@clean = false
@backup_dir = "/mnt/backup/depository"

#=====================================================================
# functions
#=====================================================================

def check_writable( dir )
  dir = File.dirname( dir ) until (File.exist?(dir) == true)
  raise "dir '#{dir}' not writable" if not File.writable?( dir )
end

def check_dir(dir)

  check_writable( dir )

  if not File.exist?(dir)
    FileUtils.mkdir(dir)
    puts "## dir '#{dir}' created" if @verbose
    return 1
  else
    print "## check '#{dir}' dir: " if @verbose
    if File.directory?(dir)
      puts "ok" if @verbose
      return 0
    else
      raise "!! not a dir '#{dir}'"
    end
  end
end

def join_config(conf_file)
  require 'yaml'

  new_conf = YAML::load_file(conf_file)

  if @debug
    require 'pp'
    pp new_conf
  end

  if new_conf.has_key?('mkpath')
    @mkpath = new_conf['mkpath']
  end

  if new_conf.has_key?('rotate')
    @rotate = new_conf['rotate']
  end

  if new_conf.has_key?('clean')
    @clean = new_conf['clean']
  end

  if new_conf.has_key?('base_dir')
    @backup_dir = new_conf['base_dir']
  end

  if new_conf.has_key?('force')
    puts "!! use -f as command argument for force"
  end
end

def usage
puts <<EOF
usage: #{__FILE__} <options>
  "--user",    "-u" - separate users
  "--mkpath",  "-m" - create path
  "--help",    "-h" - this help
  "--verbose", "-v" - verbose output
  "--debug",   "-d" - debug output (includes -v)
  "--rotate",  "-r" - separate by days
  "--clean",   "-c" - clean content of directory
  "--force",   "-f" - force cleaning even it is stupid
  "--version", "-V" - print current version
  "--dump-config"   - print current settings on stdout
EOF
end

#=====================================================================
# config file handling
#=====================================================================

conf_file = "depository.yaml"

# check global config
if File.exist?("/etc/#{conf_file}")
  puts "|| global config exists" if @debug
  join_config("/etc/#{conf_file}")
end

# check user config
if File.exist?("#{ENV['HOME']}/.#{conf_file}")
  puts "|| user config exists" if @debug
  join_config("#{ENV['HOME']}/.#{conf_file}")
end

#=====================================================================
# otpion handling
#=====================================================================

opts = GetoptLong.new(
  [ "--user",    "-u", GetoptLong::NO_ARGUMENT ],
  [ "--mkpath",  "-m", GetoptLong::NO_ARGUMENT ],
  [ "--help",    "-h", GetoptLong::NO_ARGUMENT ],
  [ "--verbose", "-v", GetoptLong::NO_ARGUMENT ],
  [ "--debug",   "-d", GetoptLong::NO_ARGUMENT ],
  [ "--clean",   "-c", GetoptLong::NO_ARGUMENT ],
  [ "--rotate",  "-r", GetoptLong::NO_ARGUMENT ],
  [ "--force",   "-f", GetoptLong::NO_ARGUMENT ],
  [ "--version", "-V", GetoptLong::NO_ARGUMENT ],
  [ "--dump-config",   GetoptLong::NO_ARGUMENT ]
)

begin
opts.each do |opt, arg|
  puts "Option: #{opt}, arg #{arg.inspect}" if @debug

  if opt == "--help"
    usage
    exit( 0 )
  end

  if opt == "--verbose"
    @verbose = true
    next
  end

  if opt == "--debug"
    @verbose = true
    @debug = true
    next
  end

  if opt == "--user"
    user = ENV['USER']
    next
  end

  if opt == "--mkpath"
    @mkpath = true
    next
  end

  if opt == "--rotate"
    @rotate = true
    next
  end

  if opt == "--clean"
    @clean = true
    next
  end

  if opt == "--force"
    force = true
    next
  end

  if opt == "--dump-config"
    require 'yaml'
    config = {}
    config['mkpath'] = @mkpath
    config['rotate'] = @rotate
    config['clean'] = @clean
    config['base_dir'] = @backup_dir
    puts config.to_yaml
    exit( 0 )
  end

  if opt == "--version"
    puts "#{__FILE__} v#{VER} - under (new) BSD license (c) 2009-10 by Jakub Vitak <mainiak at gmail dot com>"
    exit( 0 )
  end

end
rescue GetoptLong::InvalidOption
  usage
  exit( 2 )
end

puts "Remaining args: #{ARGV.join(', ')}" if @debug

#=====================================================================
# check if set --clean and not --rotate -> need --force
#=====================================================================

if ((@clean == true) and (@rotate == false))
  if (force == false)
    puts "!! Using --clean without --rotate is not good idea.  use --force to override"
    usage
    exit( 1 )
  else
    puts "# cleaning forced" if @verbose
  end
end

#=====================================================================
# for init - SHOULD BE MOVED TO wrapper (depository.sh) [2 FIX !]
#=====================================================================

## create basedir and set permission if needed
if (ENV['USER'] == 'root') and not File.exist?(@backup_dir)
  puts "# creating base_dir '#{@backup_dir}'" if @verbose
  FileUtils.mkdir_p( @backup_dir )
  FileUtils.chmod( 0770, @backup_dir )
  FileUtils.chown( nil, 100, @backup_dir )
  ## FIX: group 'users' on archlinux - change for other systems
  # or better move to global config as option
end

#=====================================================================
# creating backup path code (main)
#=====================================================================

## check user
@backup_dir += "/user/#{user}" if (user != nil)

## do rotation
if (@rotate == true)
  require 'date'
  day = Time.now.wday
  day = 7 if (day == 0) ## fix sunday
  @backup_dir += "/#{day}"
else
  ## if not rotating, dump everything here
  @backup_dir += "/data"
end

## create path if necesseary
if (@mkpath == true)
  check_writable( @backup_dir )

  if not File.exist?( @backup_dir )
    puts "# dir '#{@backup_dir}' not exist, creating" if @verbose
    FileUtils.mkdir_p( @backup_dir )
    FileUtils.chmod( 0700, @backup_dir )
  else
    puts "# dir '#{@backup_dir}' exist" if @verbose
  end
else
  if File.exist?( @backup_dir )
    raise "dir '#{@backup_dir}' doesn't exist"
  end
end

## clean path if necesseary
if (@clean == true)
  raise "dir '#{@backup_dir}' not writable" if not File.writable?( @backup_dir )
  if @debug
    require 'pp'
    pp Dir["#{@backup_dir}/*"]
  else
    FileUtils.rm_r( backup_dir )
  end
end

## that's all folks!
puts @backup_dir

## End
