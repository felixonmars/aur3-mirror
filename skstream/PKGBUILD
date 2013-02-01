# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=skstream
pkgver=0.3.9
pkgrel=1
pkgdesc="WorldForge socket library"
arch=(i686 x86_64)
url="http://worldforge.org/dev/eng/libraries/skstream"
license=('LGPL')
source=( "http://switch.dl.sourceforge.net/sourceforge/worldforge/skstream-$pkgver.tar.bz2")


build() {
  cd "$startdir/src/skstream-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$startdir/src/skstream-$pkgver"

  make DESTDIR="$pkgdir" install
}

md5sums=('c91f31f76cc47b721bcfb3b69a65b009')
