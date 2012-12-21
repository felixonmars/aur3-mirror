pkgname=kdevelop-custom-buildsystem-git
pkgver=20121220
pkgrel=1
pkgdesc="Custom buildsystem plugin for KDevelop- Git build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevplatform-git')
makedepends=('cmake' 'automoc4' 'perl' 'git')
provides=('kdevelop-custom-buildsystem')
conflicts=('kdevelop-custom-buildsystem')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/kdevelop"
_gitname="kdev-custom-buildsystem"

build() {
    cd "$srcdir"
    msg "Connecting to Git server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "Git checkout done."
    msg "Starting make..."

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../${_gitname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
    cd "$srcdir/build"

    make DESTDIR="${pkgdir}" install
}
