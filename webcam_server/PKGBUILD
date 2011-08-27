# Contributor: Juan Diego Tascon

pkgname=webcam_server
pkgver=0.50
pkgrel=3
pkgdesc="webcam_server is a program that allows others to view your webcam from a web browser"
url="http://webcamserver.sourceforge.net/"
depends=('libjpeg')
license=('GPL')
arch=('i686' 'x86_64')
source=("http://jaist.dl.sourceforge.net/sourceforge/webcamserver/${pkgname}-${pkgver}.tar.gz")
md5sums=('96830836f64edbb12c248eb84e6b0d18')

build() {
	cd $srcdir/$pkgname-$pkgver
	
	CFLAGS="-ljpeg"
	./configure --prefix=/usr || return 1
	make || return 1
	make prefix=$pkgdir/usr install
	
	# Install the client
	mkdir -p $pkgdir/usr/share/webcam_server
	cp -rf src/client $pkgdir/usr/share/webcam_server
}

