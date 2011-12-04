# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kdevelop-extra-plugins-custom-buildsystem-git
pkgver=20111204
pkgrel=1
pkgdesc="A plugin to be able to use projects that use a buildsystem not currently supported by KDevelop."
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/kdev-custom-buildsystem"
_gitname="custom-buildsystem"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname
        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    mkdir -p "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    cmake ../$_gitname \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" install
}
