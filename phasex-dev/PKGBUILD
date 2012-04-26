# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=phasex
pkgname=$_name-dev
pkgver=m1
pkgrel=3
pkgdesc="A development branch of PHASEX software synthesizer"
arch=(i686 x86_64)
url="http://disabled.github.com/phasex-dev/"
license=('GPL')
depends=('lash')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"
source=("http://github.com/downloads/disabled/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('24a59e992c55f0598891da7c57c55df5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # DSO link fix
  LDFLAGS+=" -lX11 -lgmodule-2.0" \
  ./configure --prefix=/usr \
              --enable-arch=native
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 misc/$_name.desktop \
    "$pkgdir/usr/share/applications/$_name.desktop"

  # icon
  install -Dm644 pixmaps/$_name-icon.png \
    "$pkgdir/usr/share/pixmaps/$_name-icon.png"
}

# vim:set ts=2 sw=2 et:
