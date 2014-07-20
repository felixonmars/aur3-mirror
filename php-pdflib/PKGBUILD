pkgname=('php-pdflib')
pkgver=3.0.4
pkgrel=1
pkgdesc="pdflib for php"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pdflib"
license=('PHP')
depends=('php>=5.2' 'pdflib')
provides=('php-pdf')
install=${pkgname}.install
source=("http://pecl.php.net/get/pdflib-${pkgver}.tgz"
        'pdflib.ini')
backup=(etc/php/conf.d/pdflib.ini)
sha256sums=('18de7bf00983a5b0fbbd4f7e993ecf948217072ae6ebff9fbb0eef88b8984b7e'
            'edab2347dbbe9a350a7368448ec6f86b09d052db9b7118a6b1146344552724ee')

build() {
  cd ${srcdir}/pdflib-${pkgver}
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/pdflib-${pkgver}

  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 ${srcdir}/pdflib.ini ${pkgdir}/etc/php/conf.d/pdflib.ini
}

