# Maintainer : heathjohns <heath@elesi.org>

pkgname=python-pyfftw
pkgver=0.9.2
pkgrel=0
pkgdesc="pyFFTW is a pythonic wrapper around FFTW, the speedy FFT library."
arch=('i686' 'x86_64')
url="https://github.com/hgomersall/pyFFTW"
license=('GPL')
depends=('python' 'python-numpy>=1.6' 'fftw>=3.3' 'cython>=0.15')
source=("https://pypi.python.org/packages/source/p/pyFFTW/pyFFTW-$pkgver.tar.gz")
md5sums=('34fcbc68afb8ebe5f040a02a8d20d565')

build() {
  cd "$srcdir/pyFFTW-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pyFFTW-$pkgver"
  python setup.py install --root=$pkgdir
}
