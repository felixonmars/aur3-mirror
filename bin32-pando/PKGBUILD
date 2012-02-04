#Contributor: mightyjaym <jm.ambrosino@free.fr>

pkgname=bin32-pando
_pkgname=pandodl
pkgver=0.9.2.0
pkgrel=4
pkgdesc="Free personal P2P software that makes sending, receiving and publishing large files a breeze."
arch=(x86_64)
url="http://www.pando.com/phpbb/viewtopic.php?t=4046"
license="custom"
depends=('lib32-gtk2' 'lib32-libstdc++5' 'lib32-e2fsprogs' 'lib32-nss' 'lib32-libtiff' 'lib32-nspr'  'lib32-gstreamer0.10-base' 'lib32-gconf' 'lib32-libxdamage' 'lib32-sqlite3')
source=(http://www.pando.com/dl/download/$_pkgname-$pkgver.tar.bz2 'pandodl_fix' 'pando.desktop' 'license.txt')
md5sums=('94ab8db83b3628e648d8cabb603ba88b' 'b123587d456232c0ff294c9bd262274b' \
	'a7c0f0ce8cea666ca92dce2b89a0074a' '8edcb50b765498b4810c49e0b116aa6d')

build() {
	
	cd $startdir/src/$_pkgname-21684
	
	mkdir -p $startdir/pkg/opt/pando/
	mkdir -p $startdir/pkg/usr/share/{applications,pixmaps,licenses/bin32-pando}

	cp {bin,lib,README} $startdir/pkg/opt/pando/ -r
	
	#Pandodl with absolute path
	install -D -m755  $startdir/src/pandodl_fix $startdir/pkg/opt/pando/pandodl	
	
	#Icon and .Desktop
	cp pando_icon48.png $startdir/pkg/usr/share/pixmaps
	cp $startdir/src/pando.desktop $startdir/pkg/usr/share/applications
	
	#License
	cp $startdir/src/license.txt $startdir/pkg/usr/share/licenses/bin32-pando/license.txt
	
	#Symlink
	mkdir -p $startdir/pkg/usr/bin
	ln -s /opt/pando/pandodl $startdir/pkg/usr/bin/pandodl
	
	# Remove "nspr" libs
	rm $startdir/pkg/opt/pando/lib/{libnspr4.so,libplc4.so,libplds4.so}
	#Remove "nss" libs
	rm $startdir/pkg/opt/pando/lib/{libfreebl3.so,libnss3.so,libnssckbi.so,libsmime3.so,libsoftokn3.so,libssl3.so}
	
	#libtiff fix (?)
	ln -s /opt/lib32/usr/lib/libtiff.so $startdir/pkg/opt/pando/lib/libtiff.so.4
	
}