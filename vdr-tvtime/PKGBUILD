# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>
pkgname=vdr-tvtime
pkgver=0.0.2a
pkgrel=1
pkgdesc="Wrapper script for TVtime to control VDR with the keyboard"
arch=('i686' 'x86_64')
url="http://vdrportal.de/board/thread.php?threadid=18234&threadview=0&hilight=&hilightuser=0&page=1"
license=('GPL2')
depends=('vdr' 'tvtime' 'perl')
source=(http://vdrportal.de/board/attachment.php?attachmentid=3559)
md5sums=(3094019c17cabc205686f2cabede8fe8)

build() {
  cd "$srcdir/vdr-tvtime_0.0.2a" || return 1
  
  mkdir -p $pkgdir/usr/bin || return 1
  cp vdr-tvtime.pl $pkgdir/usr/bin/ || return 1
  
  mkdir -p $pkgdir/etc/tvtime || return 1
  cp -r map.txt $pkgdir/etc/tvtime || return 1

  mkdir -p $pkgdir/usr/share/doc/vdr-tvtime || return 1
  cp -r COPYING $pkgdir/usr/share/doc/vdr-tvtime || return 1
  cp -r README* $pkgdir/usr/share/doc/vdr-tvtime || return 1
  cp -r INSTALL* $pkgdir/usr/share/doc/vdr-tvtime || return 1
}
