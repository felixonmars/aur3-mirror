# Maintainer: Markus Unterwaditzer <markus@unterwaditzer.net>
pkgname=tox-ntox-git
pkgdesc='Simple test client for tox, a Skype replacement that respects your privacy'

license=('GLPv3')
pkgver=0.0.0
pkgrel=2
depends=('libsodium' 'libconfig' 'ncurses')
makedepends=('cmake' 'git')
conflicts=('tox-ntox')
provides=('tox-ntox')
arch=('i686' 'x86_64')
url=('http://tox.im')

source=('git+https://github.com/irungentoo/ProjectTox-Core.git')
md5sums=('SKIP')

_gitname=ProjectTox-Core
pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd $_gitname
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd $_gitname/build
    #make DESTDIR="$pkgdir" install
    install -Dm755 testing/nTox $pkgdir/usr/bin/nTox
}
