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
pkgver=20111203
pkgrel=3
pkgdesc="Open Source soft switch (telephony engine) built from git"
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
source=('freeswitch.conf.d' 'freeswitch.rc.conf' 'README.freeswitch')
changelog='ChangeLog'
md5sums=('418ac2e771833fd37d3ec880916feba8'
         '160e21eff0d0e969a6104d3b308cd5fe'
         'bfa0c6c70c8173bc78fd228bd42a98ef')

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
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -a "$srcdir/$_gitname" "$srcdir/$_gitname-build"
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
      $pkgdir/etc/freeswitch/autoload_configs/modules.conf.xml
  else
    msg "Enabling module ${_fs_mod} in modules.conf.xml"    
    sed -i -e "s|^\(\s*\)<\!--\s*\(<load module=\"${_fs_mod}\"/>\)\s*-->|\1\2|" \
      $pkgdir/etc/freeswitch/autoload_configs/modules.conf.xml
  fi

}

disable_mod_xml() {
  _fs_mod=$(basename $1)
  msg "Disabling module ${_fs_mod} in modules.conf.xml"    
  sed -i -e "s|^\(\s*\)\(<load module=\"${_fs_mod}\"/>\)|\1<\!-- \2 -->|" \
    $pkgdir/etc/freeswitch/autoload_configs/modules.conf.xml
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" ${_sounds}moh-install
  make DESTDIR="$pkgdir/" ${_sounds}sounds-install
  # Mangle freeswitch's installed dirs into a more compliant structure,
  # leaving symlinks in their place so freeswitch doesn't notice.
  [ -d $pkgdir/var/spool/freeswitch ] || mkdir -p $pkgdir/var/spool/freeswitch
  mv $pkgdir/var/lib/freeswitch/db $pkgdir/var/spool/freeswitch/ && 
    ln -s /var/spool/freeswitch/db $pkgdir/var/lib/freeswitch/db
  mv $pkgdir/var/lib/freeswitch/recordings $pkgdir/var/spool/freeswitch/ && \
    ln -s /var/spool/freeswitch/recordings $pkgdir/var/lib/freeswitch/recordings
  install -D -m 0755 -d $pkgdir/var/spool/freeswitch/storage && \
    ln -s /var/spool/freeswitch/storage $pkgdir/var/lib/freeswitch/storage
  rm $pkgdir/var/lib/freeswitch/mod/*.la
  rm $pkgdir/usr/lib/freeswitch/*.la
  mv $pkgdir/var/lib/freeswitch/mod $pkgdir/usr/lib/freeswitch/ && \
    ln -s /usr/lib/freeswitch/mod $pkgdir/var/lib/freeswitch/mod
  install -D $srcdir/freeswitch.rc.conf $pkgdir/etc/rc.d/freeswitch
  install -D -m 0644 $srcdir/freeswitch.conf.d $pkgdir/etc/conf.d/freeswitch.conf
  install -D -m 0644 $srcdir/README.freeswitch $pkgdir/usr/share/doc/freeswitch/README
  cp -a docs/* $pkgdir/usr/share/doc/freeswitch/
  install -D -m 0755 -d $pkgdir/usr/share/doc/freeswitch/support-d
  cp -a support-d/* $pkgdir/usr/share/doc/freeswitch/support-d/
  install -D -m 0755 -d $pkgdir/usr/share/doc/freeswitch/scripts
  cp -a scripts/* $pkgdir/usr/share/doc/freeswitch/scripts/
  # Copy upstream confs 
  install -D -m 0755 -d $pkgdir/usr/share/doc/freeswitch/examples/conf.default
  install -D -m 0755 -d $pkgdir/usr/share/doc/freeswitch/examples/conf.archlinux
  ln -s /etc/freeswitch $pkgdir/var/lib/freeswitch/conf
  cp -a $pkgdir/etc/freeswitch/* $pkgdir/usr/share/doc/freeswitch/examples/conf.default/

  for _mod in ${_enabled_modules[@]};do
    enable_mod_xml $_mod
  done

  for _mod in ${_disabled_modules[@]};do
    disable_mod_xml $_mod
  done

  mv $pkgdir/etc/freeswitch/* $pkgdir/usr/share/doc/freeswitch/examples/conf.archlinux/
} 
