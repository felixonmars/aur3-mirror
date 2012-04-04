# Maintainer: Okada Shintarou <kokuzen@gmail.com>
pkgname=python2-pyopencv
pkgver=2.1.0.wr1.2.0
pkgrel=2
pkgdesc="Python bindings for OpenCV 2.1"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyopencv/"
license=('BSD')
depends=('python2>=2.5' 'python2-numpy>=1.2' 'opencv-old<2.2' 'boost-libs')
makedepends=('python2-distribute' 'gcc' 'boost' 'cmake')
options=(!emptydirs)

source=(http://pyopencv.googlecode.com/files/pyopencv-$pkgver.tar.gz)
md5sums=('77b1fd385aa641a6c398d2abde7d95c8')

build() {
  cd "$srcdir/pyopencv-$pkgver"

  rm -rf build
  mkdir build
  cd build
  OpenCV_DIR='/opt/opencv-old/share/opencv/' cmake -D PYTHON_EXECUTABLE=/usr/bin/python2 ..

  make
  make DESTDIR="$pkgdir" install
}

