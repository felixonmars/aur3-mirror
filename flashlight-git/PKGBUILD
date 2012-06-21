# Contributor: Saeed Rasooli <saeed.gnu@gmail.com>
pkgname=flashlight-git
pkgver=20120621
pkgrel=1
pkgdesc='A simple flashlight program for desktop, witten in PyGTK'
arch=('any')
url=(https://github.com/ilius/pygtk-flashlight)
license=('GPLv3')
depends=('python2>=2.6' 'pygtk>=2.8' 'pygobject')
optdepends=()
makedepends=()
conflicts=()
source=()
md5sums=()
_gitname="pygtk-flashlight"
_gitroot="git://github.com/ilius/${_gitname}.git"
build() {
    cd ${startdir}/src
    msg "Connecting to ${_gitroot} GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin || return 1
        msg "The local files are updated."
        cd ..
    else
        git clone ${_gitroot} || return 1
    fi
    msg "GIT checkout done"
    msg "Starting make..."
    cd ${_gitname}
    mkdir -p "${pkgdir}/usr"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/share/icons"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp flashlight.py "${pkgdir}/usr/bin/flashlight"
    cp flashlight.png "${pkgdir}/usr/share/icons"
    cp flashlight.desktop "${pkgdir}/usr/share/applications"
}

