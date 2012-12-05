#Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=dupfinder
pkgver=0.8
pkgrel=3
pkgdesc="Duplicate Files Finder including GUI"
arch=('i686')
license=('GPL')
url="http://doubles.sourceforge.net/"
depends=('libjpeg6' 'libpng12' 'wxgtk') 
source=('http://downloads.sourceforge.net/project/doubles/Duplicate%20Files%20Finder/0.8.0/dupfinder-0.8.0-source_and_binaries.tar.gz')
md5sums=('d2f0fe030155793419df77f42fc42ce8')

#build() {
	#cd $srcdir/$pkgname-$pkgver/source
		
	#./configure
	#make -f makefile.unix unicode=1 shared=1 debug=0	
#}

package() {
	cd $srcdir/$pkgname-$pkgver/binary

	mkdir ${pkgdir}/usr/
	mkdir ${pkgdir}/usr/bin/
	cp -R ${srcdir}/dupfinder-${pkgver}/binary/* ${pkgdir}/usr/bin/
}