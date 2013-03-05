# Maintainer: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=bofh
pkgver=1.62
pkgrel=3
pkgdesc="Bastard Operator from Hell: Servers Under Siege is a top view shooter with a retro computing feeling."
arch=('i686' 'x86_64')
url="http://cadaver.homeftp.net/games.htm"
license=('BSD')
makedepends=('bme')
depends=('sdl')

source=('http://cadaver.homeftp.net/misc/bofh.zip'
        'makefile.patch')

md5sums=('2f3c13ea9d860a84772258c7d1662026'
         '95ba8d02205e8b14512559b7c232b81a')


build() {
	cd $srcdir/src
	patch -u makefile $srcdir/makefile.patch

	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/opt/$pkgname/data
	mkdir -p $pkgdir/opt/$pkgname/missions
	mkdir -p $pkgdir/usr/share/licenses/$pkgname

	install -m644 $srcdir/data/* $pkgdir/opt/$pkgname/data
	install -m644 $srcdir/missions/* $pkgdir/opt/$pkgname/missions
	
	install -m755 $srcdir/bofh $pkgdir/opt/$pkgname
	install -m755 $srcdir/bofhedit $pkgdir/opt/$pkgname
	
	install -m644 $srcdir/*.txt $pkgdir/opt/$pkgname
	install -m644 $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname
	
	echo -e "#!/bin/sh\ncd /opt/bofh\n./bofh" > $pkgdir/usr/bin/bofh
	echo -e "#!/bin/sh\ncd /opt/bofh\n./bofhedit" > $pkgdir/usr/bin/bofhedit
	chmod 0755 $pkgdir/usr/bin/bofh
	chmod 0755 $pkgdir/usr/bin/bofhedit
}
