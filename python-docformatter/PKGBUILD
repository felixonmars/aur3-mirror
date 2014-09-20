# Maintainer: aericson <de.ericson@gmail.com> 

pkgname=python-docformatter
_pypi_name=docformatter
pkgver=0.7
pkgrel=1
pkgdesc="Formats docstrings to follow PEP 257."
arch=(any)
url="https://github.com/myint/docformatter"
license=('custom:Expat')
depends=('python-untokenize')
makedepends=('python-distribute')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/d/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
md5sums=('647e9297a01bd0a58c4fac4aa20347d7')

package() {
  cd "$srcdir/${_pypi_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

