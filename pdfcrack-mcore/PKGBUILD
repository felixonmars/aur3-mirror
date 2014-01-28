# Maintainer: Chaplyuk Alexandr <chaplyuk.alexandr@gmail.com>
pkgname=pdfcrack-mcore
rln=pdfcrack
pkgver=0.11
pkgrel=1
pkgdesc="PDFCrack multi-core and multi-computer extension"
arch=('i686' 'x86_64')
url="http://andi.flowrider.ch/research/pdfcrack.html"
license=('GPL')
depends=('glibc')
conflicts=('pdfcrack')
source=("${pkgname}-${pkgver}.${pkgrel}.tar::http://andi.flowrider.ch/research/public/$rln/$rln.tar")
md5sums=('3520faf0be34a64c5507c5bb8ce3a9db')

build() {
  cd $srcdir
  make
}

package() {
  install -D -m755 "$srcdir"/$rln "$pkgdir"/usr/bin/$rln
}
