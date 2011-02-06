pkgname=php-pdf
pkgver=2.1.8
pkgrel=1
pkgdesc="pdflib for php"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pdflib"
license=('PHP')
depends=('php' 'pdflib')
provides=('php-pdf')
source=(http://pecl.php.net/get/pdflib-$pkgver.tgz)
md5sums=('ee1b7c30b68b2caba8a95ef9a45e9b84')

build() {
  cd "$srcdir/pdflib-$pkgver"

  phpize || return 1
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT="$pkgdir" install
}

