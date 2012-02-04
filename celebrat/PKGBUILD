# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=celebrat
pkgver=20070325
pkgrel=1
pkgdesc="Very simple, non-interactive, text-mode calendar application."
arch=(i686 x86_64)
url="http://a.baire.free.fr/celebrat/"
license=('GPL2')
depends=(glibc)
source=(http://a.baire.free.fr/celebrat/archive/snapshot/${pkgname}-${pkgver}.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('8748468c1d2508dc2b7d928570b96530')
