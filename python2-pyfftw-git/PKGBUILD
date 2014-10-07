
pkgname=python2-pyfftw-git
pkgver=192.729c6bd
pkgrel=1
pkgdesc="A pythonic wrapper around FFTW"
arch=('i686' 'x86_64')
url="http://hgomersall.github.com/pyFFTW/"
license=('BSD')
depends=('python2-numpy' 'fftw')
makedepends=('cython2')
options=(!emptydirs)
source=("git://github.com/hgomersall/pyFFTW.git")

md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/pyFFTW"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/pyFFTW"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyFFTW"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

