# Maintainer: Dan Henry <daniel.henry@hgst.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=lib32-cpputest
pkgsrcname=cpputest
pkgver=3.6
pkgrel=1
pkgdesc="Unit testing and mocking framework for C/C++ (32 bit)"
url="http://cpputest.org"
arch=('x86_64')
license=('BSD')
provides=('cpputest')
options=('staticlibs' '!strip')
source=("https://github.com/${pkgsrcname}/${pkgsrcname}/archive/v${pkgver}.tar.gz")
md5sums=('08ea8185fb0bb52d952c1a71ac9be831')

build() {
    cd ${srcdir}/${pkgsrcname}-${pkgver}

    ./configure --prefix=/usr --libdir=/usr/lib32 --build=i686-pc-linux-gnu "CFLAGS=-m32 -g -O2" "CXXFLAGS=-m32 -g -O2" "LD=$(which ld) -m32"
    make
}

package() {
    cd ${srcdir}/${pkgsrcname}-${pkgver}

    make DESTDIR=${pkgdir} install

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
#./configure --libdir=lib32 --build=i686-pc-linux-gnu --prefix=/home/dhenry/test "CFLAGS=-m32 -g -O2" "CXXFLAGS=-m32 -g -O2" "LD=`which ld` -m32"
