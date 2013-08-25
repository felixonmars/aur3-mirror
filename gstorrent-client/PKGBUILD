# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gstorrent-client
pkgver=0009
pkgrel=1
pkgdesc="GSTorrent-client is a GUI for GSTorrent-server."
arch=('i686' 'x86_64')
url="http://gstorrent.sourceforge.net/"
license=('GPL2')
depends=('qt4')
optdepends=('gstorrent-server')
source=(http://prdownloads.sourceforge.net/gstorrent/GSTorrentClient.$pkgver.tar.bz2
        http://linux.softpedia.com/screenshots/ico/GSTorrent.gif
        GSTorrent-Client.desktop)
md5sums=('e7bb58b033a3c9b598be444ead6d0ad3'
         '864f036e116ff0fc54ef2d4c34161ab0'
         '42d493e055e5f41dcdc830893c989107')

prepare() {
  cd $srcdir/GSTorrentClient
  qmake-qt4
}

build() {
  cd $srcdir/GSTorrentClient
  make
}

package() {
  cd $srcdir/GSTorrentClient
  install -Dm755 GSTorrentC $pkgdir/usr/bin/GSTorrent-Client
  
  # Desktop icon
  cd ..
  install -Dm644 GSTorrent.gif $pkgdir/usr/share/pixmaps/GSTorrent-Client.gif
  install -Dm644 GSTorrent-Client.desktop $pkgdir/usr/share/applications/GSTorrent-Client.desktop
  
}