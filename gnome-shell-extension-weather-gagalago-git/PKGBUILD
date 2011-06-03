pkgname=gnome-shell-extension-weather-gagalago-git
pkgver=20110603
pkgrel=2
pkgdesc="Weather extension for Gnome-Shell"
arch=('any')
url="https://github.com/gagalago/gnome-shell-extension-weather"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("gnome-shell-extension-weather-gagalago-git")
install=('gschemas.install')

_gitroot="git://github.com/gagalago/gnome-shell-extension-weather.git"
_gitname="gnome-shell-extension-weather-gagalago"

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
    cd "${srcdir}/gnome-shell-extension-weather-gagalago"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/"
    ./autogen.sh --prefix="${pkgdir}/usr" --disable-schemas-compile
    make
    make install
}

