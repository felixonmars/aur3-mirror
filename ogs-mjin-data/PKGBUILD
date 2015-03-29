# Author: Michael Kapelko <kornerr@gmail.com>
pkgname=ogs-mjin-data
pkgver=0.6.0
pkgrel=1
pkgdesc="Data for OGS MJIN tools"
arch=('i686' 'x86_64')
url=('https://opengamestudio.org')
license=('Zlib')
depends=()
makedepends=()
source=(http://176.196.60.235/ogs-mjin-data-0.6.0.tar.bz2)
md5sums=('1adaa06367a2f93d1165d830d97dfe02')

package() {
    install -d ${pkgdir}/usr/share/ogs-mjin
    cp -R ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/share/ogs-mjin/resources
}

