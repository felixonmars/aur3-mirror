# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=mysqlctl
pkgver=0.2.1
pkgrel=1
pkgdesc='Basic set of tools to interact with a MySQL database'
url='https://github.com/pschmitt/mysqlctl'
arch=('any')
license=('GPL3')
depends=('mariadb' 'gzip')
source=("https://github.com/pschmitt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8610330688f672118e4760710c638356')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 mysqlctl "${pkgdir}/usr/bin/mysqlctl"
}
