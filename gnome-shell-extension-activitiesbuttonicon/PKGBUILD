# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=gnome-shell-extension-activitiesbuttonicon
_pkgname=activitiesbuttonicon
pkgver=2.0
pkgrel=1
pkgdesc='Replace Activities button text with Archlinux icon'

license=('GPL2')
url="http://fpmurphy.com/gnome-shell-extensions"
source=("http://www.fpmurphy.com/gnome-shell-extensions/${_pkgname}-${pkgver}.tar.gz")

depends=('gnome-shell>=3.2.0')

arch=('any')
md5sums=('f23e889c0d9e8349b99955ab0f13859a')

package () {
    _uuid="${_pkgname}@fpmurphy.com"
    cd "${srcdir}/${_uuid}"

    # Set Archlinux icon as default
    sed -i 's/fedora-logo-icon/archlinux-logo-icon/g' extension.js

    # The extension
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    install -p -m0644 extension.js metadata.json \
        "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
# expandtab:tabstop=4:shiftwidth=4
