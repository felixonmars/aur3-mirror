
pkgname=python2-pyfftw
pkgver=0.9.2
pkgrel=1
pkgdesc="pyFFTW is a pythonic wrapper around FFTW, the speedy FFT library."
arch=('i686' 'x86_64')
url="https://github.com/hgomersall/pyFFTW"
license=('GPL')
depends=('python2-numpy' 'fftw')
makedepends=('cython2')
source=("https://pypi.python.org/packages/source/p/pyFFTW/pyFFTW-$pkgver.tar.gz")
md5sums=('34fcbc68afb8ebe5f040a02a8d20d565')

build() {
  cd "$srcdir/pyFFTW-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyFFTW-$pkgver"
  python2 setup.py install --root=$pkgdir
}
