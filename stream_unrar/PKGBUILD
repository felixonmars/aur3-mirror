# Contributor: Frederik Alkærsig (FALKER, FALK) <havnelisten@gmail.com>
pkgname=stream_unrar
pkgver=0.1
pkgrel=1
pkgdesc="Start extracting multi-part rar archives as soon as the first part is available"
arch=('i686')
license=('GPL2')
source=(http://stream-unrar.googlecode.com/files/stream_unrar_source.tar.bz2)
md5sums=('f84963f5932c623030b704213cbe0aeb')
url="http://code.google.com/p/stream-unrar/"

build() {

	cd ${startdir}/src/
	make
	install -d $startdir/pkg/usr/bin
	install -d $startdir/pkg/usr/lib
	install $startdir/src/libunrar.so $startdir/pkg/usr/lib
	install $startdir/src/stream_unrar $startdir/pkg/usr/bin

}

