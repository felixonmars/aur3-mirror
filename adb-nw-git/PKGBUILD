# Maintainer: Laszlo Papp <gmail at gmail com>

pkgname=adb-nw-git
pkgver=20110622
pkgrel=1
pkgdesc="Google Android phone debugging tool, -nw branch"
arch=('i686' 'x86_64')
url="http://android.com/"
license=('GPL')
depends=('zlib')
makedepends=('git' 'cmake')
source=()
md5sums=()


_gitroot="git://github.com/pcwalton/android-platform-system-core-nw.git"
_gitname="android-platform-system-core-nw"

build() {
    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin/nw
    else
        git clone $_gitroot $_gitname
        cd $_gitname
        git checkout origin/nw
    fi

    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make || return 1
    make install DESTDIR=$pkgdir || return 1
}

