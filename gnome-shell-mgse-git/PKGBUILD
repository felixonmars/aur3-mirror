pkgname=gnome-shell-mgse-git
pkgver=20111105
pkgrel=1
pkgdesc="Linux Mint Shell Extensions for Gnome 3"
arch=('any')
url="https://github.com/linuxmint/MGSE"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'

_gitroot="https://github.com/linuxmint/MGSE.git"
_gitname="MGSE"

build() {
    cd ${srcdir}
    msg "Connecting to the GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot} ${_gitname}
        cd ${_gitname}
    fi
    msg "GIT checkout done."
}

package() {
    cd $srcdir/${_gitname}/
    #./test
    cp -r ./mgse-*/usr $pkgdir/
}

