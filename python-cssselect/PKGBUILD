# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
_pypi_name='cssselect'
pkgver=0.7.1
pkgrel=1
pkgdesc="Parses CSS3 Selectors and translates them to XPath 1.0."
license=('BSD')
arch=('any')
depends=('python')

pkgname="python-${_pypi_name}"
_pypi_name_inital=$(echo ${_pypi_name}|cut -c1)
source=("http://pypi.python.org/packages/source/${_pypi_name_inital}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
url="http://packages.python.org/${_pypi_name}/"
md5sums=('c6c5e9a2e7ca226ce03f6f67a771379c')


package() {
  cd "${srcdir}/${_pypi_name}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
