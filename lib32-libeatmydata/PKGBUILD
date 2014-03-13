# Maintainer: Jonathan Squirawski <webmaster@sky-siteweb.com>

pkgname=lib32-libeatmydata
pkgver=82
pkgrel=1
pkgdesc='library and utilities designed to disable fsync and friends'
arch=('x86_64')
url='https://launchpad.net/libeatmydata'
license=('GPL3')
makedepends=('gcc-multilib')
conflicts=('eatmydata')
source=("https://launchpad.net/libeatmydata/trunk/libeatmydata-${pkgver}/+download/libeatmydata-${pkgver}.tar.gz")
md5sums=('56a4d342f209ab75a9ee360236e3e5bc')

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"

    cd libeatmydata-${pkgver}

    # Fix-up python version
    find . -type f | while read i; do sed -i 's/python/python2/' $i; done

    ./configure --prefix=/usr --libexecdir=/usr/lib32/libeatmydata --libdir=/usr/lib32
    make
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/bin/eatmydata" "${pkgdir}/usr/bin/eatmydata32"
}
