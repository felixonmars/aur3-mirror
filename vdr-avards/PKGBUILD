# Contributor Leszek Czurylo <leniu_user@wp.pl>
pkgname=vdr-avards
pkgver=0.1.5
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A avards plugin for VDR"
url="http://firefly.vdr-developer.org/avards/"
license="GPL"
depends=('gcc' 'vdr>=1.6.0')
backup=()
source=(http://firefly.vdr-developer.org/avards/$pkgname-$pkgver.tar.bz2)
md5sums=('9748aa3d1aeeecea40d69cf4fe95c941')

build() {

    cd $startdir/src/avards-$pkgver
    
    mkdir -p $startdir/pkg/usr/lib/vdr
    mkdir -p $startdir/pkg/usr/src/VDR/locale

    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale clean
    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale all || return 1

}
