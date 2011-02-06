# Contributor: dejavu <pauli8585@hotmail.com>
pkgname=vdr-osdpip
pkgver=0.0.10
pkgrel=3
pkgdesc="Shows additional a second minimized channel in VDR"
arch=('i686' 'x86_64')
url="http://www.magoa.net/linux/index.php?view=osdpip"
license=('GPLv2')
depends=('ffmpeg' 'vdr>=1.5.0')
makedepends=('gcc')
source=(http://home.arcor.de/andreas.regel/files/osdpip/$pkgname-$pkgver.tgz)
md5sums=('d6210e9de576f9a6c6ef06751043c43e')

build() {

    cd $startdir/src/osdpip-$pkgver

    mkdir -p $startdir/pkg/usr/lib/vdr
    mkdir -p $startdir/pkg/usr/src/VDR/locale

    sed -i Makefile -e 's/#WITH_NEW_FFMPEG_HEADERS/WITH_NEW_FFMPEG_HEADERS/'

    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr clean
    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr all || return 1

}
