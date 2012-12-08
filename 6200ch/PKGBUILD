# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=6200ch
pkgver=22974
pkgrel=1
pkgdesc="Control the channel of a Motorola DCT 6200 connected to your PC."
arch=('any')
url=('http://svn.mythtv.org/trac/browser/trunk/mythtv/contrib/channel_changers/6200ch')
license=('GPL')
depends=('libavc1394' 'libraw1394')
makedepends=('wget')
license=('GPL')
url=('http://svn.mythtv.org/trac/browser/trunk/mythtv/contrib/channel_changers/6200ch')
provides=("6200ch")

build() {
  cd $srcdir

  wget http://svn.mythtv.org/trac/export/22974/trunk/mythtv/contrib/channel_changers/6200ch/6200ch.c
  wget http://svn.mythtv.org/trac/export/22974/trunk/mythtv/contrib/channel_changers/6200ch/Makefile
  wget http://svn.mythtv.org/trac/export/22974/trunk/mythtv/contrib/channel_changers/6200ch/README
  
  make
  
  mkdir -vp $pkgdir/usr/bin
  cp -v 6200ch $pkgdir/usr/bin/6200ch
  chmod +x $pkgdir/usr/bin/6200ch
}
