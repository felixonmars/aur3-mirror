# Contributor: Andremosfet <andremosfet@hotmail.it>
pkgname=vdr-plugin-vnsiserver
pkgver=32590
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="VNSI Server for VDR"
url="https://xbmc.svn.sourceforge.net/svnroot/xbmc/branches/pvr-testing2/xbmc/pvrclients/vdr-vnsi/vdr-plugin-vnsiserver/"
license="GPL"
depends=('vdr-devel>=1.7.0') 
source=()
md5sums=()

_svntrunk=https://xbmc.svn.sourceforge.net/svnroot/xbmc/branches/pvr-testing2/xbmc/pvrclients/vdr-vnsi/vdr-plugin-vnsiserver
_svnmod=vdr-plugin-vnsiserver

build() {
        cd $startdir/src
	svn co $_svntrunk	
        cd $startdir/src/$pkgname 
  
  msg "Starting build..."

    mkdir -p $startdir/pkg/usr/lib/vdr
    mkdir -p $startdir/pkg/etc/vdr/plugins/vnsiserver


    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr clean

    make VDRDIR=/usr/src/VDR \
         LIBDIR=$startdir/pkg/usr/lib/vdr \
         LOCALEDIR=$startdir/pkg/usr/src/VDR/locale \
         PLUGINLIBDIR=$startdir/pkg/usr/lib/vdr all || return 1
  # Install configuration etc. files
  install -m755 vnsiserver/allowed_hosts.conf ${pkgdir}/etc/vdr/plugins/vnsiserver || return 1
  install -m755 vnsiserver/noSignal.mpg ${pkgdir}/etc/vdr/plugins/vnsiserver || return 1
  }
