# Maintainer: Samsagax <samsagax@gmail.com>

pkgname=gnome-shell-extension-inhibit-suspend-git
pkgver=20120426
pkgrel=1
pkgdesc="Yet Another Inhibit Suspend Extension is a GNOME shell extension that adds a switch to the User Menu that gives you the ability to inhibit auto-suspend or screensaver from activating"
arch=('any')
url="https://github.com/lavi741/gnome-shell-extension-inhibit-suspend"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("inhibit-suspend")

_gitroot="git://github.com/lavi741/gnome-shell-extension-inhibit-suspend.git"
_gitname="gnome-shell-extension-inhibit-suspend"

build() {
    cd ${srcdir}/
    msg "Connecting to the GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
	cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot} ${_gitname}
    fi
    msg "GIT checkout done."
}

package() {

    cd "${srcdir}/${_gitname}"

    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
    cp -rv "inhibit-suspend@lavi.a" "${pkgdir}/usr/share/gnome-shell/extensions"

}
