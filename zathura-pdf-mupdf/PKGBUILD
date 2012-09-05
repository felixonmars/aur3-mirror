# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.2.1
pkgrel=1
pkgdesc="Adds pdf support to zathura by using the mupdf library"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura/plugins/zathura-pdf-mupdf/"
license=('custom')
depends=('mupdf>=1.1' 'zathura>=0.2.0')
conflicts=('zathura-pdf-mupdf-git' 'zathura-pdf-poppler' 'zathura-pdf-poppler-git')
source=("https://pwmt.org/projects/zathura/plugins/download/$pkgname-$pkgver.tar.gz")
md5sums=('954b6375b5d81e91cd7477e8a5b4552f')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}
package(){
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
