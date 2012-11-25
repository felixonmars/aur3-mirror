# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=gnome15-impulse15
pkgver=0.0.13
pkgrel=1
pkgdesc="Impulse plugin for gnome15"
arch=(any)
url="http://www.gnome15.org/"
license=('GPL')
depends=(gnome15 fftw libpulse)
source=(http://www.gnome15.org/downloads/Gnome15/Optional/$pkgname-$pkgver.tar.gz)
md5sums=('6149240e431505ff3f67759703030aac')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr PYTHON=python2 PYTHON_VERSION=2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
