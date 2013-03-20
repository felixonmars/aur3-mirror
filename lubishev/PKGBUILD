# Author: Michael Kapelko <kornerr@gmail.com>
pkgname=lubishev
pkgver=0.2
pkgrel=2
pkgdesc="Time management application that allows you to quickly write down events into distributed files (you can assign a Dropbox directory) for later analysis."
arch=('i686' 'x86_64')
url=('https://bitbucket.org/kornerr/lubishev')
license=('GPL')
depends=('qt4')
makedepends=('gcc cmake make')
source=(https://bitbucket.org/kornerr/lubishev/downloads/lubishev-$pkgver.tar.bz2)
md5sums=('a7a04493a840ec37069dce065cd220b6')

BUILD=$srcdir/build

build() {
    [[ -d $BUILD ]] && rm -rf $BUILD
    mkdir $BUILD
    cd $BUILD
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr $srcdir/$pkgname-$pkgver
    make
}

package() {
    cd $BUILD
    make DESTDIR=$pkgdir install
}

