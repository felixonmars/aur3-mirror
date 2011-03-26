# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=quazaa-svn
pkgver=456
pkgrel=1
pkgdesc="Multi-network P2P file-sharing client based on Shareaza which will support Gnutella2, Ares, eDonkey2000 (eMule), HTTP, FTP, and BitTorrent."
arch=('i686' 'x86_64')
url="http://quazaa.sourceforge.net"
license=('GPL3')
depends=('qt')
makedepends=('subversion')

_svntrunk=http://quazaa.svn.sourceforge.net/svnroot/quazaa/
_svnmod=quazaa

build() {
   cd $startdir/src/

   svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

   msg "SVN checkout done or server timeout"
   msg "Starting make..."

   # Compilation
   cd $srcdir/quazaa/trunk
   qmake
   make
   
   # Installation
   mkdir -p $pkgdir/usr/share/quazaa
   cd bin/
   rm -rf ./GeoIP/.svn/
   rm -rf ./Skin/.svn/
   cp -R GeoIP/ Skin/ $pkgdir/usr/share/quazaa
   install -Dm755 Quazaa $pkgdir/usr/share/quazaa

   # Desktop icon
   install -Dm644 ../QuazaaSkinTool/Resource/Quazaa48.png $pkgdir/usr/share/pixmaps/quazaa.png
   install -Dm644 $startdir/quazaa.desktop $pkgdir/usr/share/applications/quazaa.desktop
}

