# Maintainer: Markus Unterwaditzer <markus[AT]unterwaditzer.net>
pkgname=tox-qt
pkgdesc='Secure messaging for everyone (CLI client)'

license=('GLPv3')
pkgrel=1
pkgver=2419e63
depends=('qt5-base' 'libsodium' 'libconfig')
makedepends=('git')
arch=('i686' 'x86_64')
url=('http://tox.im')

source=('git+https://github.com/nurupo/ProjectTox-Qt-GUI.git')
md5sums=('SKIP')

_gitname=ProjectTox-Qt-GUI
pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    git submodule init
    git submodule update
    mkdir build
    cd build
    qmake-qt5 -Wall ../projectfiles/QtCreator/TOX-Qt-GUI.pro
    make
}

package() {
    cd $_gitname/build
    #make DESTDIR="$pkgdir" install
    install -Dm755 ./TOX-Qt-GUI $pkgdir/usr/bin/TOX-Qt-GUI
}
