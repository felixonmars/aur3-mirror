# Contributor: Martin Devera <devik@cdi.cz>
pkgname=mnogosearch-phpext
pkgver=1.96
pkgrel=2
pkgdesc="Search Engine Software PHP extension"
url="http://www.mnogosearch.org/"
license="PHP"
depends=('php>=4.3.1' 'mnogosearch>=3.2.38')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.mnogosearch.org/Download/php/mnogosearch-php-extension-$pkgver.tar.gz)
md5sums=('01fed9f462257b644a66a72d1b5376d8')

build() {
  cd $startdir/src/$pkgver
  phpize
  ./configure --with-mnogosearch=/usr
  make || return 1
  make INSTALL_ROOT=$startdir/pkg install
}
