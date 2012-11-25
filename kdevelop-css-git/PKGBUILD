# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-css-git
pkgver=20121113
pkgrel=1
pkgdesc="KDevelop Plugin for CSS Language Support"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git' 'kdevelop-pg-qt-git')
provides=('kdevelop-css')
conflicts=('kdevelop-css')

_gitroot="git://anongit.kde.org/kdev-css"
_gitname="css"

build() {
    msg "Connecting to Git server..."

    if [ -d $_gitname ] ; then
        cd $_gitname

        # Revert no-tests.patch
        git checkout .

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
