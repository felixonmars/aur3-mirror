# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=gnome-shell-extension-remove-accessibility-icon
_pkgname=remove-accessibility-icon
pkgver=20111008
pkgrel=3
pkgdesc='A gnome-shell extension for removing the accessibility icon'

license=('BSD')
url="http://martin-weusten.de/projects/gnomeshell-extensions/remove-accessibility-icon/"
source=("http://martin-weusten.de/wp-content/uploads/2011/05/${_pkgname}${pkgver}-1019.tar.gz"
        "gnome-3.4.patch")

depends=('gnome-shell>=3.2.0')

arch=('any')
md5sums=('4c1721c13fcb45594b1007690c4eba68'
         'acaaa057864915fe1ccb0dfbead35088')

package () {
    _uuid="${_pkgname}@martin-weusten.de"
    cd "${srcdir}/${_uuid}"
    patch -Np1 -i ../gnome-3.4.patch

    # The extension
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    install -Dp -m 0644 {extension.js,metadata.json,stylesheet.css} \
        "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

    # License file
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dp -m 644 COPYING \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
# expandtab:tabstop=4:shiftwidth=4
