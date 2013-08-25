# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gstorrent-server
pkgver=0015
pkgrel=1
pkgdesc="GSTorrent daemon/server that handles all the file transfers as a Bittorrent client."
arch=('i686' 'x86_64')
url="http://gstorrent.sourceforge.net/"
license=('GPL2')
depends=('qt4')
source=(http://prdownloads.sourceforge.net/gstorrent/GSTorrent.$pkgver.tar.bz2
        GSTorrent-Server.install)
md5sums=('6c2adcbd9e6a5595dc4dff1b5b01c4f0'
         'afef12c3d14f711492098b199e9a3d3d')
install=GSTorrent-Server.install

prepare() {
  cd $srcdir/GSTorrent
  qmake-qt4
}

build() {
  cd $srcdir/GSTorrent
  make
}

package() {
  cd $srcdir/GSTorrent
  install -Dm755 GSTorrent $pkgdir/usr/bin/GSTorrent
}