# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=gnome-shell-extension-lhsmenu
_pkgname=lhsmenu
pkgver=1.0
pkgrel=1
pkgdesc='LHS Mint Menu extension. Add a full menu to left-hand side of top panel'

license=('GPL2')
url="http://fpmurphy.com/gnome-shell-extensions"
source=("http://www.fpmurphy.com/gnome-shell-extensions/${_pkgname}-${pkgver}.tar.gz")

depends=('gnome-shell>=3.2.0')

arch=('any')
md5sums=('666639884937034d161cf90b48c2f2e8')

package () {
    _uuid="${_pkgname}@fpmurphy.com"
    cd "${srcdir}/${_uuid}"

    # The extension
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -pr icons {extension.js,metadata.json,stylesheet.css} \
        "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
# expandtab:tabstop=4:shiftwidth=4
