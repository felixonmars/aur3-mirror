# Contributor Leszek Czurylo <leniu_user@wp.pl>
pkgname=vdr-director
pkgver=0.2.8
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A director plugin for VDR"
url="http://www.linuxtv.org/vdrwiki/index.php/Director-plugin"
license="GPL"
depends=('gcc' 'vdr>=1.6.0')
backup=()
source=(http://www.wontorra.net/filemgmt_data/files/$pkgname-$pkgver.tar.gz
	http://privatepaste.com/download/85nrYQDvbt)
	
md5sums=('c84f9dd7103b9b6f245cd62ca88efdfa'
	 '9e6cae83d882bff7dde640675536bbfe')

build() {


    patch -p0 -i ../85nrYQDvbt
    
    cd $startdir/src/director-$pkgver
    
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
