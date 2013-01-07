# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-crossfire-git
pkgver=20130105
pkgrel=1
pkgdesc="KDevelop Debugger plugin for debugging JavaScript using crossfire"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-executebrowser-git')
makedepends=('cmake' 'automoc4' 'git')
provides=('kdevelop-crossfire')
conflicts=('kdevelop-crossfire')

_gitroot="git://anongit.kde.org/kdev-crossfire"
_gitname="crossfire"

build() {
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/build"
    mkdir "$srcdir/build"
    cd "$srcdir/build"

    cmake ../"${_gitname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
