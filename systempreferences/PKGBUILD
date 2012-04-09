# Maintainer: libernux <dutchman55@gmx.com>

pkgname=systempreferences
pkgver=1.1.0
pkgrel=1
pkgdesc="GNUstep System Preferences"
arch=(i686 x86_64)
url="http://www.gnustep.org/experience/systempreferences.html"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back)
makedepends=(gcc-objc)
provides=(systempreferences)
source=(ftp://ftp.gnustep.org/pub/gnustep/usr-apps/SystemPreferences-$pkgver.tar.gz)
noextract=()
md5sums=('3888927a7d20b19efaef4939ab15293b')


build() {
  cd $srcdir/SystemPreferences-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
  make DESTDIR=$pkgdir install
}

