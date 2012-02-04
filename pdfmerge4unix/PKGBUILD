# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdfmerge4unix
pkgver=1.0
pkgrel=2
arch=('any')
pkgdesc="merges pdf files from command line"
url="http://sourceforge.net/projects/pdfmerge4unix/"
license=('GPL2')
depends=('perl')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/pdfmerge-$pkgver.tar.gz)
md5sums=('acb9fc8a65e3524dd1077d7285650c49')

build() {
  sed -i 's#ps2pdf#ps2pdf -sNOSAFER#' pdfmerge 
  install -Dm755 $srcdir/pdfmerge $pkgdir/usr/bin/pdfmerge 
}

