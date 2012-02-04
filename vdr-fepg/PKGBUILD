# Contributor Leszek Czurylo <leniu_user@wp.pl>
pkgname=vdr-fepg
pkgver=0.4.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="VDR plugin: show epg of multiple channels graphically"
url="http://www.fepg.tk/"
license="GPL"
depends=('gcc' 'vdr>=1.6.0')
backup=()
source=(http://www.fepg.org/files/$pkgname-$pkgver.tgz)
md5sums=('5e7545c5c54ffb4f5f03e202285ab060')

build() {

    cd $startdir/src/fepg-$pkgver
    
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
