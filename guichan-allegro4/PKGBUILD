# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=guichan-allegro4
pkgver=0.8.2
pkgrel=1
pkgdesc="guichan with fix for bug FS29824"
arch=('i686' 'x86_64')
url="http://guichan.sourceforge.net/"
license=('BSD')
makedepends=('sdl_image' 'allegro4' 'libgl' 'glut')
conflicts=('guichan-sdl' 'guichan-allegro' 'guichan-opengl' 'guichan-glut')
provides=('guichan-sdl' 'guichan-allegro' 'guichan-opengl' 'guichan-glut')
options=(!libtool !strip)
source=(http://guichan.googlecode.com/files/guichan-$pkgver.tar.gz)
md5sums=('af535d7f387e774e3197cef8023ea105')

build() {
    cd $srcdir/guichan-$pkgver
    CXXFLAGS="-g" ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/guichan-$pkgver
    make prefix=$pkgdir/usr install

    # Install the license, as required for BSD
    install -m644 -D COPYING $pkgname/usr/share/licenses/guichan/LICENSE
}
