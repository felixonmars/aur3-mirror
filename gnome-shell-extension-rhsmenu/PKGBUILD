# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=gnome-shell-extension-rhsmenu
_pkgname=rhsmenu
pkgver=1.0
pkgrel=1
pkgdesc='RHS Mint Menu extension. Add a full menu to right-hand side of top panel'

license=('GPL2')
url="http://fpmurphy.com/gnome-shell-extensions"
source=("http://www.fpmurphy.com/gnome-shell-extensions/${_pkgname}-${pkgver}.tar.gz")

depends=('gnome-shell>=3.2.0')

arch=('any')
md5sums=('56a994cbfb4cd84a83c4322ce2473210')

package () {
    _uuid="${_pkgname}@fpmurphy.com"
    cd "${srcdir}/${_uuid}"

    # The extension
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -pr icons {extension.js,metadata.json,stylesheet.css} \
        "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
# expandtab:tabstop=4:shiftwidth=4
