# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=pysycache
pkgver=3.1c
pkgrel=1
pkgdesc="Educational software for teaching kids how to use the mouse"
arch=('i686' 'x86_64')
url="http://www.pysycache.org/"
license=("GPL")
depends=('python-pygame')
install=pysycache.install
options=('docs')
source=(http://download.tuxfamily.org/py4childs/pysycache/v3.1/pysycache-src-$pkgver.zip)
md5sums=('491573cbc7ab4c9b4c73305eedb4aea7')

build() {
	#create directories
	install -d -m755 $startdir/pkg/{etc/pysycache,usr/{bin,share/doc/pysycache,man/man1,share/pysycache}}
	install -d -m775 $startdir/pkg/var/games/pysycache
	cd $startdir/src/pysycache-src/linux
	make ||return 1
	#copy files
	install -D -m755 pysycache $startdir/pkg/usr/bin/
	cp -R man/* $startdir/pkg/usr/man/man1/
	cp -R usr/* $startdir/pkg/usr/
	cp -R etc/* $startdir/pkg/etc/
	cp -R $startdir/src/pysycache-src/pysycache/* $startdir/pkg/usr/share/pysycache/
	mv $startdir/pkg/usr/share/pysycache/doc/* $startdir/pkg/usr/share/doc/pysycache/
	# better in the doc directory
	mv $startdir/pkg/usr/share/pysycache/{AUTHORS,COPYING,ChangeLog,INSTALL,NEWS,README} $startdir/pkg/usr/share/doc/pysycache/
}
