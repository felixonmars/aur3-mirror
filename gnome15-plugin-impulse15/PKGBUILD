# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=gnome15-plugin-impulse15
_pkgname=gnome15-impulse15
pkgver=0.0.15
pkgrel=1
pkgdesc="Gnome15 Impulse plugin"
arch=('i686' 'x86_64')
url="http://www.russo79.com/gnome15"
license=('GPL')
depends=('gnome15' 'fftw' 'libpulse')
replaces=('gnome15-impulse15')
groups=('gnome15-plugins')
source=("https://projects.russo79.com/attachments/download/123/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2496bd3411a05a57f09159c72d8e9128')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr PYTHON=python2 PYTHON_VERSION=2
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
