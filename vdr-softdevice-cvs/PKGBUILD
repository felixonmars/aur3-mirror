# Contributor: Maik Opitz <maik@fjordblau.de>
pkgname=vdr-softdevice-cvs
pkgver=20080421
pkgrel=1
arch=(i686)
pkgdesc="A output plugin for VDR"
url="http://softdevice.berlios.de/"
license="GPL"
depends=('vdr>=1.6.0' 'ffmpeg' 'alsa-lib')
conflicts=('vdr-softdevice')
provides=('vdr-softevice')
source=()
md5sums=()
_cvsroot=":pserver:anonymous:@cvs.softdevice.berlios.de:/cvsroot/softdevice"
_cvsmod="softdevice"

build() {

    cd $startdir/src
    
    if [ -d $_cvsmod/CVS ]; then
      cd $_cvsmod
      cvs -z3 update -d
    else
      cvs -d$_cvsroot login
      cvs -z3 -d$_cvsroot co -D $pkgver -f -P $_cvsmod
    fi
    
    cd $startdir/src/$_cvsmod

    mkdir -p $startdir/pkg/usr/lib/vdr

    ./configure --disable-yaepg --disable-oss

    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr clean
    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr all || return 1

}
