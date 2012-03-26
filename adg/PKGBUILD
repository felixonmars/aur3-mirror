# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=adg
pkgver=0.6.5
pkgrel=1
pkgdesc="Automatic Drawing Generation is a set of functions focused on automating the drawing of mechanical parts."
arch=(i686 x86_64)
url="http://adg.entidi.com/"
license=('LGPL')
depends=('gtk3')
makedepends=('gtk-doc')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('0ac83bc7070fde7ce25b54262a2bb207')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
