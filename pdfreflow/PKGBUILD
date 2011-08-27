# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=pdfreflow
pkgver=0.8.6
pkgrel=1
pkgdesc="operates on the output of pdftohtml and reflows the texts into paragraphs."
arch=('any')
url="http://pdfreflow.sourceforge.net/"
license=('GPLv3')
makedepends=('gcc')
optdepends=('pdftohtml: for converting PDF files into HTML and XML formats')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tgz)

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=$pkgdir/usr
  make
  make install
}
md5sums=('4e6344d5cfcbee34a128c2ce5727d61c')