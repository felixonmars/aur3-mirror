# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Contributor: David Sommer <icecook@sourceforge.net
pkgname=touchdaemon-git
pkgver=20100314
pkgrel=1
pkgdesc="A tool to dis-/enable the touchpad during typping automaticly"
arch=('i686' 'x86_64')
url="http://touchdaemon.sourceforge.net"
license=('unknown')
groups=()
depends=('xorg-server')
makedepends=('git')
provides=()
conflicts=()
replaces=()
options=()
backup=("/etc/rc.d/touchdaemon" "/etc/rc.d/touchdaemon.conf" )
install=touchdaemon.install
noextract=()

_gitroot="git://touchdaemon.git.sourceforge.net/gitroot/touchdaemon/touchdaemon"
_gitname="touchdaemon"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  make || return 1
  #make DESTDIR="$pkgdir/" install
  [ -d $pkgdir/usr/share/touchdaemon ] || mkdir $pkgdir/usr/share/touchdaemon -p
  [ -d $pkgdir/usr/bin ] || mkdir $pkgdir/usr/bin -p
  
  cp $srcdir/$_gitname-build/touchdaemon $pkgdir/usr/bin/touchdaemon || return 1
  rm $srcdir/$_gitname-build/touchdaemon* || return 1
  cp -r $srcdir/$_gitname-build/* $pkgdir/usr/share/touchdaemon || return 1

 
  [ -d $pkgdir/etc/rc.d/ ] || mkdir $pkgdir/etc/rc.d/ -p
  
  [  $pkgdir/etc/touchdaemon.conf -f ] ||  cat << EOF  >> $pkgdir/etc/touchdaemon.conf
#To dis-/enable your touchpad use a bash command string and replace 
#"Logitec Touchpad" with your one. You get the name with the command 
#"xinput list".
#COMMAND='xinput set-prop "Logitech Touchpad" "Device Enabled"'
COMMAND=""
#touchdaemon puts a " 0" or " 1"  at the end of your command to alternate 
#the touchpad state.
EOF

  cat << EOF >> $pkgdir/etc/rc.d/touchdaemon
#!/bin/bash
. /etc/touchdaemon.conf
. /etc/rc.d/functions

if [ "\$COMMAND" = "" ]; then 
echo "no command in /etc/touchdaemon.conf"
exit 1
fi

case "\$1" in
start)
	stat_busy "Starting touchdaemon"
	/usr/bin/touchdaemon "-c\${COMMAND}" -d
	if [ $? -gt 0 ]; then
          stat_fail
        else
          add_daemon touchdaemon
          stat_done
        fi
        ;;
stop)
	stat_busy "Stopping touchdaemon"
	killall touchdaemon
	rm_daemon touchdaemon
	stat_done
	;;
esac
exit 0
EOF

chmod 755 $pkgdir/etc/rc.d/touchdaemon
} 
