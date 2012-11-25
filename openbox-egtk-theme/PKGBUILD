# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributor: Ivan Sichmann Freitas <ivansichfreitas at gmail dot com>

pkgname=openbox-egtk-theme
_tname="elementary_for_openbox_by_grvrulz-d46mqcz"
pkgver=1.0
pkgrel=1
pkgdesc="Openbox theme matching the latest egtk"
arch=('any')
url="http://grvrulz.deviantart.com/art/elementary-for-openbox-253002995"
license=('cc-by-sa-3.0')
depends=('openbox')
source=(http://www.deviantart.com/download/253002995/$_tname.zip)
md5sums=('2626eba749b4c945c82badae849874ff')

build() {
    /bin/true
}

package () {
    cd ${srcdir}
    unzip $_tname.zip
    tar xf egtk.obt
    mkdir -p ${pkgdir}/usr/share/themes
    cp -r egtk ${pkgdir}/usr/share/themes/
}
