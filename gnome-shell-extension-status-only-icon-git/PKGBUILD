#Maintainer: Caio Alonso <caio@caioalon.so>
pkgname=gnome-shell-extension-status-only-icon-git
pkgver=20111208
pkgrel=1
pkgdesc="A GNOME Shell extention to display just an icon for status menu"
url="https://github.com/llaumgui/gnome-shell-status-only-icon"
license=('GPL2')
arch=('any')
depends=('gnome-shell')
makedepends=('git')

_gitroot="https://github.com/llaumgui/gnome-shell-status-only-icon.git"
_gitname="gnome-shell-status-only-icon"
_extensionname="status-only-icon@llaumgui.com"

build() {
    cd ${srcdir}
    msg "Connecting to the GIT server..."
    if [ -d ${_gitname} ] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot} ${_gitname}
    fi
    msg "GIT checkout done."
}

package() {
    cd ${srcdir}/${_gitname}
    install -Dm644 extension.js ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}/extension.js
    install -Dm644 metadata.json ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}/metadata.json
    install -Dm644 README.md ${pkgdir}/usr/share/gnome-shell/extensions/${_extensionname}/README.md
}


