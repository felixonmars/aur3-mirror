# Maintainer: schmoemi <schmoemi at arcor dot de>
# Contributor: schmoemi <schmoemi at arcor dot de>

pkgname=odf-xslt
pkgver=0.4
pkgrel=2
pkgdesc="PHP 5 library for automated generation of ODF documents with XSLT"
arch=('i686' 'x86_64')
url="http://www.jejik.com/odf-xslt/"
license=('GPL')
depends=('php>=5.2' 'libxslt' 'zlib')
source=(http://www.jejik.com/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4385a9c6bd8182b268eea113dde14dc4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/" install
}
