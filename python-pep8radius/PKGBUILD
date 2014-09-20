# Maintainer: aericson <de.ericson@gmail.com> 

pkgname=python-pep8radius
_pypi_name=pep8radius
pkgver=0.8.2
pkgrel=1
pkgdesc="PEP8 clean only the parts of the files touched since the last commit, a previous commit or branch."
arch=(any)
url="https://github.com/hayd/pep8radius"
license=('MIT')
depends=('python-autopep8'
         'python-colorama'
         'python-docformatter')
makedepends=('python-distribute')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/p/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
md5sums=('07902f0a3f4704302033c1dad523f24f')

package() {
  cd "$srcdir/${_pypi_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

