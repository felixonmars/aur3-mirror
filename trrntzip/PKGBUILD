# Contributor: mikers <mikeonthecomputer@gmail.com>

pkgname=trrntzip
pkgver=0.2 
pkgrel=7
pkgdesc="TorrentZip is a replacement for MameZip. The goal of the program is to use standard values when creating zips to create identical files over multiple systems."
url="http://sourceforge.net/projects/trrntzip"
arch=('i686' 'x86_64' )
license=('GPL')
depends=('zlib' 'autoconf' 'automake' )
source=(http://downloads.sourceforge.net/trrntzip/${pkgname}_v02_src.tar.gz
        patch-src-trrntzip.c)
md5sums=('2635a4042b3cf5611ffdffb4019ec8b7'
         '672603eb35516d69db084dc7e2029e96')
build() {
	cd $startdir/src/${pkgname}
	patch -Np0 -i $startdir/patch-src-trrntzip.c
	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac
	./autogen.sh
	./configure
	make || return 1

}
package(){
	cd $startdir/src/${pkgname}
	install -Dm755 src/${pkgname} ${pkgdir}/usr/bin/${pkgname}

}
