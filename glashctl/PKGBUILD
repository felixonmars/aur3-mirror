# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=glashctl
pkgver=0.4.4
pkgrel=1
pkgdesc="a simple applet for controlling the LASH Audio Session Handler."
arch=(i686 x86_64)
url="http://dino.nongnu.org/glashctl/"
license=('GPL')
depends=('lash' 'util-linux' 'gtkmm')
source=("http://download.savannah.nongnu.org/releases/dino/$pkgname-$pkgver.tar.bz2")
md5sums=('419d8608e5b3f5f0d02e812c34a7ef1a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  unset LDFLAGS

  echo "prefix = /usr" > Makefile.config
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
