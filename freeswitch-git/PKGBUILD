# This builds the FreeSWITCH open source telephone engine
# from the freeswitch git.  It enables the following modules
# not enabled in the standard freeswitch build:
#  * mod_callcenter
#  * mod_xml_curl
# And disables the following standard modules:
#  * mod_dialplan_asterisk
#  * mod_say_ru
#  * mod_spidermonkey
#  * mod_lua
# You can modify this and other options in the BUILD CONFIGURATION section below

# Built using http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# Maintainer: TJ Vanderpoel <tj@rubyists.com>

# BUILD CONFIGURATION BEGINS #

# ENABLE THIS IF YOU WANT ODBC IN THE CORE (uncomment it)
# You must have unixodbc installed or the build will fail

#_odbc=--enable-core-odbc-support

# SET THIS TO GET HIGHER QUALITY SOUNDFILES
# Value can be "hd-", "uhd-", or "cd-" to get 16k, 32k, or 48k sounds.
# By default we only download the 8k sounds. If you only use g711 or
# 8k codecs, leave this as-is

_sounds=""

# ADDED MODULES
# If you don't need/want these modules remove them from _enabled_modules
# You can add any modules here you wish to add, make sure they're not
# in _disabled_modules, though
#
# xml_int/mod_xml_curl - Remote http dialplan lookups/control
# xml_int/mod_xml_cdr - Remote http dialplan lookups/control
# applications/mod_callcenter - Inbound call queueing system
_enabled_modules=(xml_int/mod_xml_curl
                  xml_int/mod_xml_cdr
                  formats/mod_shout
                  applications/mod_callcenter)

# DISABLED MODULES
# Remove from _disabled_modules if you want to build these
#
# languages/mod_spidermonkey - server-side javascript
# languages/mod_lua - server-side lua
# say/mod_say_ru - Russian phrases
# dialplans/mod_dialplan_asterisk - Legacy dialplan
_disabled_modules=(languages/mod_spidermonkey
                   languages/mod_lua
                   say/mod_say_ru
                   dialplans/mod_dialplan_asterisk)

# NOTE: We build --without-python due to Arch defaulting python3 as python. 
# Uncomment the following to attempt building it anyway

#_python=--with-python

# CONCURRENT BOOTSTRAP
# Uncomment this to enable backgrounded concurrent bootstrap operations.
# You will suffer a lot of autotools scroll from this, Fair Warning.

#_concurrent="-j"

# BUILD CONFIGURATION ENDS                     #
#                                              #
# CHANGE ANYTHING BELOW HERE AT YOUR OWN RISK! #
#                                              #

pkgname=freeswitch-git
pkgver=20120107
pkgrel=2
pkgdesc="Open Source soft switch (telephony engine) built from a specific, stable git commit tag"
arch=('i686' 'x86_64')
url="http://freeswitch.org"
license=('MPL')
depends=("util-linux-ng")
makedepends=('git' 'libjpeg' 'curl')
optdepends=('unixodbc: for odbc support in the core'
            'python: for some contrib scripts')
provides=('freeswitch')
conflicts=('freeswitch')
install=freeswitch.install
source=('freeswitch.conf.d' 'freeswitch.rc.conf' 'README.freeswitch' 'run.freeswitch' 'run_log.freeswitch' 'conf_log.freeswitch')
changelog='ChangeLog'

_gitroot="git://git.freeswitch.org/freeswitch.git"
_gitname="freeswitch"

enable_module() {
  _fs_mod=$1
  sed -i -e "s|^#${_fs_mod}|${_fs_mod}|" modules.conf
}

disable_module() {
  _fs_mod=$1
  sed -i -e "s|^${_fs_mod}|#${_fs_mod}|" modules.conf
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin master
    msg "The local files are updated."
  else
    git clone --depth 1 $_gitroot
    msg "FreeSWITCH repository cloned"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -a "$srcdir/$_gitname/" "$srcdir/${_gitname}-build"
  cd "$srcdir/$_gitname-build"

  # BUILD BEGINS
  msg "Bootstrapping..."
  ./bootstrap.sh ${_concurrent} > /dev/null
  msg "Bootstrap Complete"

  # MODULE ENABLE/DISABLE
  for _mod in ${_enabled_modules[@]};do
    msg "Enabling $_mod"
    enable_module $_mod
  done

  for _mod in ${_disabled_modules[@]};do
    msg "Disabling $_mod"
    disable_module $_mod
  done

  msg "Module Configuration Complete, Stop Now with Ctrl-C if the above is not correct"
  sleep 5

  # CONFIGURE
  ./configure --prefix=/var/lib/freeswitch ${_python:---without-python} \
    --bindir=/usr/bin --sbindir=/usr/sbin --localstatedir=/var \
    --sysconfdir=/etc/freeswitch --datarootdir=/usr/share \
    --libexecdir=/usr/lib/freeswitch --libdir=/usr/lib/freeswitch \
    --includedir=/usr/include/freeswitch ${_odbc}

  # COMPILE
  make
}

enable_mod_xml() {
  _fs_mod=$(basename $1)

  if [ "x$(grep $_fs_mod $pkgdir/etc/freeswitch/autoload_configs/modules.conf.xml)" == "x" ];then
    msg "Adding missing module ${_fs_mod} to modules.conf.xml"
    sed -i -e "s|^\(\s*</modules>\)|\t\t<\!-- added by archlinux package -->\n\t\t<load module=\"${_fs_mod}\"/>\n\1|" \
      "$pkgdir/etc/freeswitch/autoload_configs/modules.conf.xml"
  else
    msg "Enabling module ${_fs_mod} in modules.conf.xml"
    sed -i -e "s|^\(\s*\)<\!--\s*\(<load module=\"${_fs_mod}\"/>\)\s*-->|\1\2|" \
      "$pkgdir/etc/freeswitch/autoload_configs/modules.conf.xml"
  fi

}

disable_mod_xml() {
  _fs_mod=$(basename $1)
  msg "Disabling module ${_fs_mod} in modules.conf.xml"
  sed -i -e "s|^\(\s*\)\(<load module=\"${_fs_mod}\"/>\)|\1<\!-- \2 -->|" \
    "$pkgdir/etc/freeswitch/autoload_configs/modules.conf.xml"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" ${_sounds}moh-install
  make DESTDIR="$pkgdir/" ${_sounds}sounds-install

  cd "$pkgdir" # MUY IMPORTANT, $PWD is $pkgdir from here on out
  # Mangle freeswitch's installed dirs into a more compliant structure,
  # leaving symlinks in their place so freeswitch doesn't notice.
  [ -d var/spool/freeswitch ] || install -D -m 0755 -d var/spool/freeswitch
  [ -d var/log/freeswitch ] || install -D -m 0755 -d var/log/freeswitch
  ln -s /var/log/freeswitch var/lib/freeswitch/log
  mv var/lib/freeswitch/db var/spool/freeswitch/ && 
    ln -s /var/spool/freeswitch/db var/lib/freeswitch/db
  mv var/lib/freeswitch/recordings var/spool/freeswitch/ && \
    ln -s /var/spool/freeswitch/recordings var/lib/freeswitch/recordings
  install -D -m 0755 -d var/spool/freeswitch/storage && \
    ln -s /var/spool/freeswitch/storage var/lib/freeswitch/storage
  rm var/lib/freeswitch/mod/*.la 2>/dev/null|| true
  rm usr/lib/freeswitch/*.la 2>/dev/null|| true
  mv var/lib/freeswitch/mod usr/lib/freeswitch/ && \
    ln -s /usr/lib/freeswitch/mod var/lib/freeswitch/mod
  install -D "$srcdir/freeswitch.rc.conf" etc/rc.d/freeswitch
  install -D -m 0644 "$srcdir/freeswitch.conf.d" etc/conf.d/freeswitch
  install -D -m 0644 "$srcdir/README.freeswitch" usr/share/doc/freeswitch/README
  cp -a "$srcdir/${_gitname}-build/docs" usr/share/doc/freeswitch
  install -D -m 0755 -d usr/share/doc/freeswitch/support-d
  cp -a "$srcdir/${_gitname}-build/support-d" usr/share/doc/freeswitch/
  install -D -m 0755 -d usr/share/doc/freeswitch/scripts
  cp -a "$srcdir/${_gitname}-build/scripts" usr/share/doc/freeswitch/
  # Copy upstream confs 
  install -D -m 0755 -d usr/share/doc/freeswitch/examples/conf.default
  install -D -m 0755 -d usr/share/doc/freeswitch/examples/conf.archlinux
  ln -s /etc/freeswitch var/lib/freeswitch/conf
  cp -a etc/freeswitch/* usr/share/doc/freeswitch/examples/conf.default/

  for _mod in ${_enabled_modules[@]};do
    enable_mod_xml $_mod
  done

  for _mod in ${_disabled_modules[@]};do
    disable_mod_xml $_mod
  done

  cp -a etc/freeswitch/* usr/share/doc/freeswitch/examples/conf.archlinux/
  rm etc/freeswitch/directory/default/101?.xml
  rm etc/freeswitch/directory/default/100[1-9].xml
  rm etc/freeswitch/directory/default/example.com.xml
  rm etc/freeswitch/directory/default/skinny-example.xml
  rm etc/freeswitch/directory/default/brian.xml
  install -D -m 0755 "$srcdir/run.freeswitch" etc/sv/freeswitch/run
  install -D -m 0755 "$srcdir/run_log.freeswitch" etc/sv/freeswitch/log/run
  install -D -m 0644 "$srcdir/conf_log.freeswitch" etc/sv/freeswitch/log/conf
} 
md5sums=('f674b302edeb1895bbefcaf7bb8510ca'
         'c83b9f557a3ad362a51b48785aa00f44'
         'bfa0c6c70c8173bc78fd228bd42a98ef'
         '0797a434f3e6e8eff6d0c0fb5fcdb292'
         'e9f0bdde366bca6fd29a9202818f3591'
         'e6411d793501c29ec4afd6d54018de1b')
backup=("etc/freeswitch/autoload_configs/abstraction.conf.xml" "etc/freeswitch/autoload_configs/acl.conf.xml" "etc/freeswitch/autoload_configs/alsa.conf.xml" "etc/freeswitch/autoload_configs/blacklist.conf.xml"
"etc/freeswitch/autoload_configs/callcenter.conf.xml" "etc/freeswitch/autoload_configs/cdr_csv.conf.xml" "etc/freeswitch/autoload_configs/cdr_mongodb.conf.xml" "etc/freeswitch/autoload_configs/cdr_pg_csv.conf.xml"
"etc/freeswitch/autoload_configs/cdr_sqlite.conf.xml" "etc/freeswitch/autoload_configs/cepstral.conf.xml" "etc/freeswitch/autoload_configs/cidlookup.conf.xml" "etc/freeswitch/autoload_configs/conference.conf.xml"
"etc/freeswitch/autoload_configs/console.conf.xml" "etc/freeswitch/autoload_configs/db.conf.xml" "etc/freeswitch/autoload_configs/dialplan_directory.conf.xml" "etc/freeswitch/autoload_configs/dingaling.conf.xml"
"etc/freeswitch/autoload_configs/directory.conf.xml" "etc/freeswitch/autoload_configs/distributor.conf.xml" "etc/freeswitch/autoload_configs/easyroute.conf.xml" "etc/freeswitch/autoload_configs/enum.conf.xml"
"etc/freeswitch/autoload_configs/erlang_event.conf.xml" "etc/freeswitch/autoload_configs/event_multicast.conf.xml" "etc/freeswitch/autoload_configs/event_socket.conf.xml" "etc/freeswitch/autoload_configs/fax.conf.xml"
"etc/freeswitch/autoload_configs/fifo.conf.xml" "etc/freeswitch/autoload_configs/hash.conf.xml" "etc/freeswitch/autoload_configs/httapi.conf.xml" "etc/freeswitch/autoload_configs/http_cache.conf.xml"
"etc/freeswitch/autoload_configs/ivr.conf.xml" "etc/freeswitch/autoload_configs/java.conf.xml" "etc/freeswitch/autoload_configs/lcr.conf.xml" "etc/freeswitch/autoload_configs/local_stream.conf.xml"
"etc/freeswitch/autoload_configs/logfile.conf.xml" "etc/freeswitch/autoload_configs/lua.conf.xml" "etc/freeswitch/autoload_configs/memcache.conf.xml" "etc/freeswitch/autoload_configs/modules.conf.xml"
"etc/freeswitch/autoload_configs/mongo.conf.xml" "etc/freeswitch/autoload_configs/nibblebill.conf.xml" "etc/freeswitch/autoload_configs/opal.conf.xml" "etc/freeswitch/autoload_configs/osp.conf.xml"
"etc/freeswitch/autoload_configs/perl.conf.xml" "etc/freeswitch/autoload_configs/pocketsphinx.conf.xml" "etc/freeswitch/autoload_configs/portaudio.conf.xml" "etc/freeswitch/autoload_configs/post_load_modules.conf.xml"
"etc/freeswitch/autoload_configs/presence_map.conf.xml" "etc/freeswitch/autoload_configs/python.conf.xml" "etc/freeswitch/autoload_configs/redis.conf.xml" "etc/freeswitch/autoload_configs/rss.conf.xml"
"etc/freeswitch/autoload_configs/rtmp.conf.xml" "etc/freeswitch/autoload_configs/sangoma_codec.conf.xml" "etc/freeswitch/autoload_configs/shout.conf.xml" "etc/freeswitch/autoload_configs/skinny.conf.xml"
"etc/freeswitch/autoload_configs/sofia.conf.xml" "etc/freeswitch/autoload_configs/spandsp.conf.xml" "etc/freeswitch/autoload_configs/spidermonkey.conf.xml" "etc/freeswitch/autoload_configs/switch.conf.xml"
"etc/freeswitch/autoload_configs/syslog.conf.xml" "etc/freeswitch/autoload_configs/timezones.conf.xml" "etc/freeswitch/autoload_configs/tts_commandline.conf.xml" "etc/freeswitch/autoload_configs/unicall.conf.xml"
"etc/freeswitch/autoload_configs/unimrcp.conf.xml" "etc/freeswitch/autoload_configs/voicemail.conf.xml" "etc/freeswitch/autoload_configs/voicemail_ivr.conf.xml" "etc/freeswitch/autoload_configs/xml_cdr.conf.xml"
"etc/freeswitch/autoload_configs/xml_curl.conf.xml" "etc/freeswitch/autoload_configs/xml_rpc.conf.xml" "etc/freeswitch/autoload_configs/zeroconf.conf.xml" "etc/freeswitch/chatplan/default.xml"
"etc/freeswitch/dialplan/default/00_ladspa.xml" "etc/freeswitch/dialplan/default/01_Talking_Clock.xml" "etc/freeswitch/dialplan/default.xml" "etc/freeswitch/dialplan/features.xml"
"etc/freeswitch/dialplan/public/00_inbound_did.xml" "etc/freeswitch/dialplan/public.xml" "etc/freeswitch/dialplan/skinny-patterns/20-Local_extension.xml" "etc/freeswitch/dialplan/skinny-patterns/90-External.xml"
"etc/freeswitch/dialplan/skinny-patterns/99-Default_Drop.xml" "etc/freeswitch/dialplan/skinny-patterns.xml" "etc/freeswitch/directory/default/1000.xml" "etc/freeswitch/directory/default/default.xml"
"etc/freeswitch/directory/default.xml" "etc/freeswitch/extensions.conf" "etc/freeswitch/freeswitch.xml" "etc/freeswitch/fur_elise.ttml"
"etc/freeswitch/jingle_profiles/client.xml" "etc/freeswitch/jingle_profiles/server.xml" "etc/freeswitch/mime.types" "etc/freeswitch/mrcp_profiles/loquendo-7-mrcp-v2.xml"
"etc/freeswitch/mrcp_profiles/nuance-1.0.0-mrcp-v1.xml" "etc/freeswitch/mrcp_profiles/nuance-5.0-mrcp-v1.xml" "etc/freeswitch/mrcp_profiles/nuance-5.0-mrcp-v2.xml" "etc/freeswitch/mrcp_profiles/unimrcpserver-mrcp-v1.xml"
"etc/freeswitch/mrcp_profiles/voxeo-prophecy-8.0-mrcp-v1.xml" "etc/freeswitch/notify-voicemail.tpl" "etc/freeswitch/sip_profiles/external.xml" "etc/freeswitch/sip_profiles/internal-ipv6.xml"
"etc/freeswitch/sip_profiles/internal.xml" "etc/freeswitch/skinny_profiles/internal.xml" "etc/freeswitch/tetris.ttml" "etc/freeswitch/vars.xml"
"etc/freeswitch/voicemail.tpl" "etc/freeswitch/web-vm.tpl")
