# Maintainer: koral <koral att mailoo dott org>

pkgname=rsslounge
pkgver=1.7
pkgrel=2
pkgdesc="Free web based RSS feed reader, very similar to google reader but with priorities and images support."
arch=('any')
license=('GPL3')
url="http://rsslounge.aditu.de/"
depends=('php>=5.2.4' 'mysql')
makedepends=('unzip')
optdepends=('apache' 'lighttpd' 'nginx')
backup=()
install=${pkgname}.install
source=("${pkgname}.zip::http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.zip")
md5sums=('cc32fb414558857845a52c8320f12d22')

build() {
    msg "No build required."
}

package() {
    INSTALL_DIR="usr/share/webapps"

    mkdir -p ${pkgdir}/${INSTALL_DIR} || return 1
    cp -r ${srcdir}/${pkgname}/ ${pkgdir}/$INSTALL_DIR/ || return 1

    cd ${pkgdir}/${INSTALL_DIR}
    chown -R root:http ${pkgname} || return 1
    cd ${pkgdir}/${INSTALL_DIR}/${pkgname}
    chmod -R g+w config data/cache data/favicons data/logs data/thumbnails public/javascript public/stylesheets || return 1
}
