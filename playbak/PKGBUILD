# Contributor: Cristian Porras <cporras@global-tics.com>

pkgname=playbak
pkgver=0.0.7
pkgrel=1
pkgdesc="PlaybaK (aka KDE Media Player)"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=123016"
depends=('kdelibs' 'taglib' 'flac')
makedepends=('cmake' 'automoc4')
source=('http://customizeopera.site90.com/playbak/$pkgver/source.tar.gz')
license=(GPL)
md5sums=('c5f81760009e7f0d4a98c15fb3a18137')
build() {
    cd $srcdir/
    cd PlaybaK-0.0.7/
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
    make || return 1
    make DESTDIR=$pkgdir install
}