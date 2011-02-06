# Contributor: Thomas G. <tg1311@users.sourceforge.net>
# Maintainer: tg1311

pkgname=openspeak-server
_realpkgname=openspeak
pkgver=0.1rc2
_realpkgver=0.1-rc2
pkgrel=1
pkgdesc="openSpeak is a VoIP solution mainly aimed at gamers"
arch=('i686')
url="http://openspeak-project.org/"
license=('GPL')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/openspeak/openspeak-$_realpkgver.tar.gz")
md5sums=('e09ca5d336d1fb3f381b5bea1e9a55a9')


build() {
  cd "$srcdir/$_realpkgname-$_realpkgver"

  ./configure --prefix=/usr --disable-client --enable-server
  make || return 1
  install -m755 -D $startdir/src/openspeak-0.1-rc2/server/openspeak_server $startdir/pkg/usr/bin/openspeak_server
  install -m755 -d $startdir/pkg/usr/share/man/man1
  install -m644 -D $startdir/src/openspeak-0.1-rc2/openspeak_server.1 $startdir/pkg/usr/share/man/man1/
}