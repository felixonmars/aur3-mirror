pkgname=qtopencl
pkgver=1.0.0
pkgrel=1
pkgdesc="QT-based OpenCL framework"
url="http://labs.qt.nokia.com/2010/04/07/using-opencl-with-qt/"
license=('GPL')
arch=(any)
depends=(libcl qt opencl-headers)
makedepends=(bzip2 gzip tar xz)
source=(http://dl.dropbox.com/u/4583032/mipt/qtopencl-$pkgver-$pkgrel.tar.xz)
md5sums=('02452d7906ffa0cb52378846fa8a1b6f')




build() {
	cd $startdir/src/opencl
	./configure
	qmake && export INSTALL_ROOT=$startdir/pkg && make && make install
}


