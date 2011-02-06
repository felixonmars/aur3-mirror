#Maintainer: Sebastian Friedel <sef@voxelbrain.com>
pkgname=redbean-unittest
pkgver=0.50.62
_pkgsrcver=0.50-62
pkgrel=1
pkgdesc="C++ Unit Test Framework"
arch=('i686' 'x86_64')
url="http://unittest.red-bean.com/"
license=('BSD')
depends=()
makedepends=('subversion' 'autoconf')
provides=(redbean-unittest)
conflicts=(redbean-unittest)
source=("http://unittest.red-bean.com/tar/unittest-${_pkgsrcver}.tar.gz")

build() {
    cd $srcdir/unittest-${_pkgsrcver}

    #
    # BUILD
    #
    ./configure --prefix=/usr || return 1
    make || return 1
    make prefix=${pkgdir}/usr install || return 1
    install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING || return 1

}
md5sums=('6eaa2823620c2e21fc745bd8da6a26b2')
