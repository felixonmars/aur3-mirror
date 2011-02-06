# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=kde-media-player
pkgver=0.0.6
pkgrel=1
pkgdesc="KDE media player"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=123016"
depends=('kdelibs' 'taglib' 'flac')
makedepends=('cmake' 'automoc4')
source=('http://customizeopera.site90.com/kde_media_player/$pkgver/source.tar.gz'
'build.patch')
license=(GPL)
md5sums=('8f0eb7a79a486fbc9e7d4ad9cba4a624'
         '262bf0a84e3210b4c963449eac2b146b')
build() {
    cd $srcdir/
    patch  -p0 -i build.patch
    cd KMP/
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
    make || return 1
    make DESTDIR=$pkgdir install
}
