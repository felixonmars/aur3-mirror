# Maintainer: soeren <nonick@posteo.de>
pkgname=episode-renamer-gui-git
pkgver=0.4.5
pkgrel=4
pkgdesc="A Qt GUI for episode-renamer"
arch=('i686' 'x86_64')
url="http://github.com/Tovok7/episode-renamer-gui"
license=('GPLv3+')
depends=('pyqt' 'episode-renamer-git')
makedepends=('python' 'git')

_gitroot='git://github.com/Tovok7/episode-renamer-gui.git'
_gitname='episode-renamer-gui'

build() {
    cd ${srcdir}

    if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
    else
      git clone $_gitroot
    fi

    cd $_gitname
    make
    python ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1
}

