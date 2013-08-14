# Maintainer: Sergey Yakovlev <me@klay.me>

pkgname=gleez-mango
pkgver=0.2.1
pkgrel=1
pkgdesc='Module that monitors all system logs using MongoDB'
arch=('any')
url='https://github.com/sergeyklay/gleez-mango/'
license=('custom:Gleez CMS License')
depends=('gleez>=0.9.26')
options=('emptydirs')
install="${pkgname}.install"
source=("https://github.com/sergeyklay/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('efb148aaa24535e0a84682ada838ed5e')

build() {
    /bin/true
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d -m 644 "${pkgdir}/usr/share/webapps/gleez/modules/mango" || return 1
    cp -r * "${pkgdir}/usr/share/webapps/gleez/modules/mango"
}
