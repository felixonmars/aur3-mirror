# Author: Casey Jones <jonescaseyb@gmail.com>
# Maintainer: Kevin Barbour <kevinbarbourd@gmail.com>

pkgname=kajammer-git
pkgver=20120604
pkgrel=1
pkgdesc="Open Source Music Player based on the Qt toolkit."
url="https://github.com/jcnix/kajammer"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt' 'phonon')
makedepends=('gcc' 'qconf' 'cmake' 'git')
optdepends=('kajamtag: MP3/OGG tagging support')
provides=('kajammer')

_gitroot="git://github.com/jcnix/kajammer.git"
_gitname="kajammer"

build() {
    cd ${srcdir}

    msg "Connecting to Git server..."
    if [[ -d ${_gitname} ]]; then
        (cd ${_gitname} && git pull origin)
    else
        git clone ${_gitroot} ${_gitname}
    fi

    msg "Git checkout done or server timeout"

    rm -rf ${_gitname}-build
    git clone ${_gitname} ${_gitname}-build
    cd ${srcdir}/${_gitname}-build

    msg "Starting make..."
    ./configure
    make
}

package() {
    cd ${srcdir}/${_gitname}-build
    make DESTDIR=${pkgdir} install
} 
