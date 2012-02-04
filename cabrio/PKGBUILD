pkgname=cabrio
license=("GPL")
pkgver=0.8.2
pkgrel=1
pkgdesc="Cabrio is a graphical front end for emulators, specifically designed for use in arcade cabinets"
arch=('i686' 'x86_64')
url="http://www.cabrio-fe.org/"
depends=('sdl' 'sdl_image' 'sdl_gfx' 'sdl_mixer' 'sdl_ttf' 'freeglut' 'libxml2' 'ffmpeg')
source=("http://www.cabrio-fe.org/download/$pkgname-$pkgver.tar.gz"
        'makefile.patch')
md5sums=('56fcd0d673d4b26084a66baec998995d'
         'e84e1ef21fa4b8b1e292a86f2f45bded')

build() {
    cd $srcdir/$pkgname-$pkgver || return 1
    patch -rupN -i $srcdir/makefile.patch
    make BIN_DIR=/usr/bin DATA_DIR=/usr/share/cabrio
}

package() {
    cd $srcdir/$pkgname-$pkgver || return 1
    make DESTDIR=${pkgdir} INSTALL=/bin/install BIN_DIR=/usr/bin DATA_DIR=/usr/share/cabrio install
}
