# Contributor: juan diego tascon
pkgname=xtreemfs
pkgver=1.5
pkgrel=1
pkgdesc="A distributed and replicated file system for the Internet" 
url="http://www.xtreemfs.org" 
license="BSD" 
arch=(i686 x86_64)
depends=('python' 'boost' 'boost-libs' 'fuse' 'openssl' 'attr' 'jre7-openjdk-headless') 
makedepends=('cmake' 'apache-ant' 'jdk7-openjdk')

source=("http://www.xtreemfs.org/downloads/XtreemFS-$pkgver.tar.gz")

build() { 
	cd $srcdir/XtreemFS-$pkgver
	make all
}

package() {
	cd $srcdir/XtreemFS-$pkgver
	make DESTDIR="$pkgdir/" install
}

md5sums=('d637d392b8d3bd07a55569e8251a25f1')
