# Maintainer: Harv Chen <ch05042210[at]gmail[dot]com>
pkgname=gnome-shell-extension-window-overlay-icons-git
pkgver=20120314
pkgrel=1
pkgdesc="Easily discover which application to select by viewing the app icons in the windows overview."
url="https://github.com/vdepizzol/gnome-shell-extension-overlay-icons"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gnome-shell')

_extensionname="windowoverlay-icons@sustmidown.centrum.cz"
_gitname="gnome-shell-extension-overlay-icons"
_gitroot="https://github.com/vdepizzol/gnome-shell-extension-overlay-icons.git"
_subdir="windowoverlay-icons"

build() {
    cd "$srcdir"
    msg "Connecting to the GIT server...."

    if [[ -d $srcdir/$_gitname ]] ; then
        cd $_gitname
        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
}
package() {
    mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}
    cd ${srcdir}/$_gitname
    install -D -m 644 ${_subdir}/extension.js ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}/extension.js
    install -D -m 644 ${_subdir}/stylesheet.css ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}/stylesheet.css
    install -D -m 644 ${_subdir}/metadata.json ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}/metadata.json
    install -D -m 644 README ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}/README
}
