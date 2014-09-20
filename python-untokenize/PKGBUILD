# Maintainer: aericson <de.ericson@gmail.com> 

pkgname=python-untokenize
_pypi_name=untokenize
pkgver=0.1.1
pkgrel=1
pkgdesc="Transforms tokens into original source code (while preserving whitespace)."
arch=(any)
url="https://github.com/myint/untokenize"
license=('custom:Expat')
makedepends=('python-distribute')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/u/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
md5sums=('50d325dff09208c624cc603fad33bb0d')

package() {
  cd "$srcdir/${_pypi_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

