pkgname=gnome-shell-extension-mediaplayer-dbus-git
pkgver=20110620
pkgrel=3
pkgdesc="Mediaplayer indicator extension for gnome-shell (with dbus integration)"
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extensions-mediaplayer"
license=('GPL3')
depends=('gnome-shell' 'gnome-common')
makedepends=('git' 'intltool')
provides=("gnome-shell-extension-mediaplayer-dbus-git")

_gitroot="https://github.com/eonpatapon/gnome-shell-extensions-mediaplayer.git"
_gitname="gnome-shell-extension-mediaplayer-dbus"

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

    cd ${srcdir}/${_gitname}
    ./autogen.sh --prefix="/usr"
    make
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR=${pkgdir} install
}

