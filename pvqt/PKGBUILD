# Contributor: <kontakt.zuf(at)gmail.com>
pkgname=pvqt
pkgver=0.5.72
pkgrel=1
pkgdesc="A portable panoramic image viewer with 3D rotation and perspective control, using OpenGL in the Qt framework"
url="http://sourceforge.net/projects/pvqt/"
depends=('qt>=4.0.0' 'zlib')
makedepends=('qt>=4.0.0' 'zlib')
conflicts=('pvqt')
arch=('i686' 'x86_64')
replaces=('pvqt')
backup=()
##source=("http://dl.sourceforge.net/pvqt/pvQt-$pkgver-src.zip")
source=("http://dfn.dl.sourceforge.net/sourceforge/pvqt/pvQt-$pkgver-src.zip")
md5sums=('8156c90a22fb0f8bf1f53ddf19ee522c')
license=('GPL')

build() {
    cd $startdir/src/pvQt-$pkgver-src
    qmake
    make release || return 1
    mkdir -p "$pkgdir/usr/bin"
    cp bin/pvQt "$pkgdir/usr/bin"
}