# Maintainer: dan saul <aur@cryingwolf.org>
pkgname=6200ch
pkgver=22974
pkgrel=1
pkgdesc="Control the channel of a Motorola DCT 6200 connected to your PC."
arch=(i686 x86_64)
depends=('libavc1394' 'libraw1394')
license=('GPL')
url=('http://svn.mythtv.org/trac/browser/trunk/mythtv/contrib/channel_changers/6200ch')

build() {
cd ${startdir}/src || return 1
wget http://svn.mythtv.org/trac/export/22974/trunk/mythtv/contrib/channel_changers/6200ch/6200ch.c || return 1
wget http://svn.mythtv.org/trac/export/22974/trunk/mythtv/contrib/channel_changers/6200ch/Makefile || return 1
wget http://svn.mythtv.org/trac/export/22974/trunk/mythtv/contrib/channel_changers/6200ch/README || return 1
make || return 1
mkdir -vp ${pkgdir}/usr/bin || return 1
cp -v 6200ch ${pkgdir}/usr/bin/6200ch || return 1
chmod +x ${pkgdir}/usr/bin/6200ch
}


