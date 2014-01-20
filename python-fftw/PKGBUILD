# Maintainer: fordprefect <fordprefect@dukun.de>

pkgname=python-fftw
_py_pkgname=pyFFTW # The pypi package name
pkgver=0.9.2
pkgrel=1
pkgdesc="A pythonic wrapper around FFTW"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pyFFTW/"
license=('GPL3')
depends=('python-numpy' 'fftw')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/p/${_py_pkgname}/${_py_pkgname}-${pkgver}.tar.gz")
md5sums=('34fcbc68afb8ebe5f040a02a8d20d565')

package() {
  cd "$srcdir/$_py_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
