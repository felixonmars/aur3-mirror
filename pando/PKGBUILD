#Contributor: Dario Andres Rodriguez <darzephyr@gmail.com>

pkgname=pando
_pkgname=pandodl
pkgver=0.9.2.0
pkgrel=2
pkgdesc="Free personal P2P software that makes sending, receiving and publishing large files a breeze."
arch=(i686)
url="http://www.pando.com/phpbb/viewtopic.php?t=4046"
license="custom"
depends=('gtk2' 'libstdc++5' 'e2fsprogs' 'nss' 'libtiff')
source=(http://www.pando.com/dl/download/$_pkgname-$pkgver.tar.bz2 'pandodl_fix' 'pando.desktop' 'license.txt')
md5sums=('94ab8db83b3628e648d8cabb603ba88b' 'f6545a5a17650fe61ff240b3d84ca65f' \
	'a7c0f0ce8cea666ca92dce2b89a0074a' '8edcb50b765498b4810c49e0b116aa6d')

build() {
	
	cd $startdir/src/$_pkgname-21684
	
	mkdir -p $startdir/pkg/opt/pando/
	mkdir -p $startdir/pkg/usr/share/{applications,pixmaps,licenses/pando}

	cp {bin,lib,README} $startdir/pkg/opt/pando/ -r
	
	#Pandodl with absolute path
	cp $startdir/src/pandodl_fix $startdir/pkg/opt/pando/pandodl	
	
	#Icon and .Desktop
	cp pando_icon48.png $startdir/pkg/usr/share/pixmaps
	cp $startdir/src/pando.desktop $startdir/pkg/usr/share/applications
	
	#License
	cp $startdir/src/license.txt $startdir/pkg/usr/share/licenses/pando/license.txt
	
	#Symlink
	mkdir -p $startdir/pkg/usr/bin
	ln -s /opt/pando/pandodl $startdir/pkg/usr/bin/pandodl
	
	# Remove "nspr" libs
	rm $startdir/pkg/opt/pando/lib/{libnspr4.so,libplc4.so,libplds4.so}
	#Remove "nss" libs
	rm $startdir/pkg/opt/pando/lib/{libfreebl3.so,libnss3.so,libnssckbi.so,libsmime3.so,libsoftokn3.so,libssl3.so}
	
	#libtiff fix (?)
	ln -s /usr/lib/libtiff.so $startdir/pkg/opt/pando/lib/libtiff.so.4
	
}