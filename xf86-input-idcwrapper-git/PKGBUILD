# Maintainer: Éverton Ribeiro <nuxlli@gmail.com>
#
pkgname=xf86-input-idcwrapper-git
pkgver=0.0.1
pkgrel=1
pkgdesc="X.org warapper for input driver idctouch"
arch=(i686 x86_64)
_github="github.com/nuxlli/xf86-input-idcwrapper"
url="http://${_github}"
depends=('glibc xorg-server>=1.5.2')
makedepends=('pkgconfig' 'xorg-server>=1.5.2' 'randrproto>=1.2.1' 'git')
options=('!libtool')
groups=('xorg-input-drivers')
license=('GPL')
source=()
md5sums=()

_gitname="xf86-input-idcwrapper"
_gitroot="git://${_github}.git"

build() {
    cd ${startdir}/src
    msg "Connecting to ${_gitroot} GIT server...."
    if [[ -d ${startdir}/src/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin || return 1
        msg "The local files are updated."
    else
        git clone ${_gitroot} || return 1
    fi
    msg "GIT checkout done"
    msg "Starting make..."
    cd "${startdir}/src/${_gitname}"
    ./autogen.sh --prefix=/usr || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
