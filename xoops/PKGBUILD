# Maintainer: Julio Napurí <julionc@gmail.com>
pkgname=xoops
pkgver=2.5.1
pkgrel=1
pkgdesc="A PHP-based content management platform"
arch=('any')
url='http://www.xoops.org/'
license=('GPL')
depends=('php' 'apache' 'php-apache' 'mysql')
source=("http://downloads.sourceforge.net/project/xoops/XOOPS Core (stable releases)/XOOPS ${pkgver}/xoops-${pkgver}.tar.gz")
md5sums=('54ff90bd7afa2950f1981f3cacd2309a')

build() {
  install -dm755 "${pkgdir}/srv/http/xoops" || return 1
  cp -R ${srcdir}/xoops-${pkgver}/htdocs/* "${pkgdir}/srv/http/xoops"

  find "${pkgdir}/srv/http/${pkgname}" -type d -exec chmod 755 {} +
  find "${pkgdir}/srv/http/${pkgname}" -type f -exec chmod 644 {} +
}
