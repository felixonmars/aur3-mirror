# $Id: PKGBUILD 53897 2009-10-03 19:57:39Z eric $

pkgname=alltray-stable
pkgver=0.70
pkgrel=3
pkgdesc="Drop's any app in the tray."
license=("GPL")
arch=(i686 x86_64)
url="http://alltray.sourceforge.net"
depends=('gconf')
conflicts=(alltray)
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/alltray/alltray-$pkgver.tar.gz)
md5sums=('675a0a60f22fae04da787095ef0bd7d9')

build() {
  cd "$srcdir/alltray-$pkgver"
  export LDFLAGS=-lX11
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" install
}
