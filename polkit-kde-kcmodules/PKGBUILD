# Contributor: Max Resch <resch.max@gmail.com>

pkgname=polkit-kde-kcmodules
pkgver=20110821
pkgrel=1
pkgdesc="Configuration for Policy Kit"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/base/polkit-kde-kcmodules-1"
license=('GPL')
depends=('polkit-kde')
makedepends=('cmake' 'automoc4' 'git')

_gitroot="git://anongit.kde.org/polkit-kde-kcmodules-1"
_gitname="polkit-kde-kcmodules-1"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../${_gitname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    make
}
package() {
    cd ${srcdir}/build
    make DESTDIR=${pkgdir} install
}
