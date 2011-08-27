# Maintainer: Vadim Bubnov <vadim@moinet.ru>

pkgname=dob-plasmoid-git
pkgver=20100223
pkgrel=2
pkgdesc="Desktop OBserver plasmoid for kde 4.4"

arch=('i686' 'x86_64')
url='http://wiki.github.com/bvadim/dob-plasmoid/'
license=('GPL')
depends=('kdebase-workspace')
makedepends=('git' 'pkgconfig' 'cmake' 'libxml2')
#optdepends=('')
conflicts=($_pkgname)
#provides=()
#replaces=('')
source=()
md5sums=()

_gitroot="git://github.com/bvadim/dob-plasmoid.git"
_gitname="dob-plasmoid"

build() {
    cd ${srcdir}

    msg "Connecting to GIT server..."
    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    
    rm -rf ${srcdir}/$_gitname-build
    mkdir ${srcdir}/$_gitname-build
    cd ${srcdir}/$_gitname-build
	cmake ${srcdir}/$_gitname -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

    make || return 1
}

package() {
	cd ${srcdir}/$_gitname-build
	make DESTDIR=$pkgdir install
}
