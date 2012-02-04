pkgname=cairo-gtk-engine-cvs
pkgver=1.30
pkgrel=2
pkgdesc="An experimental gtk-engine based on cairo"
url="http://cairographics.org"
license="GPL"
depends=('cairo' 'gtk2' 'cvs')
makedepends=('gcc')
arch=(i686 x86_64)
source=()
md5sums=()

build() {
  cvs -z3 -d:pserver:anonymous@cvs.cairographics.org:/cvs/cairo co cairo-gtk-engine
  cd $startdir/src/cairo-gtk-engine
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
