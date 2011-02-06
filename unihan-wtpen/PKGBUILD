pkgname=unihan-wtpen
pkgver=2.1.99
pkgrel=1
pkgdesc="Chinese handwriting recognition tool for X"
url="http://www.unihan.com.cn/"
license=()
depends=('gtk2')
arch=('i686')
source=(http://rays.openrays.org/rays/pool/main/u/unihan-wtpen/unihan-wtpen_$pkgver-0.5.rays1.tar.gz)
md5sums=('b5155a565f52461f490791b9409a7363')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed 's/libgnomeui-2.0//' configure --in-place
  sed 's/#include <gnome.h>//' src/wtpen.c --in-place
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
