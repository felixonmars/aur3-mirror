# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-java-git
pkgver=20121113
pkgrel=1
pkgdesc="Java language support for KDevelop4"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git')
provides=('kdevelop-java')
conflicts=('kdevelop-java')

_gitroot="git://anongit.kde.org/kdev-java"
_gitname="java"

build() {
    msg "Connecting to Git server..."

    if [ -d $_gitname ] ; then
        cd $_gitname

        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "Git checkout done."
    msg "Starting make..."

    cd "$srcdir/$_gitname"
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../${_gitname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
