# Contributor: Adam Vogt <vogt.adam@gmail.com>
pkgname=panoglview
pkgver=0.2.2
pkgrel=5
pkgdesc="A standalone viewer for panoramic photos"
arch=('i686' 'x86_64')
url="http://wiki.panotools.org/Panoglview"
depends=('wxgtk' 'mesa' 'libgl')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/hugin/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('770a337c43cdd20be0347135ed1f597e')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr LIBS="-lGLU -lGL"
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
