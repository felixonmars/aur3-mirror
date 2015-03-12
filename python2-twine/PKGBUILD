# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python2-twine
_pyname=twine
pkgver=1.5.0
pkgrel=1
pkgdesc='A utility for interacting with PyPI'
arch=('any')
url='https://pypi.python.org/pypi/twine'
license=('APACHE')
depends=('python2' 'python2-setuptools' 'python2-requests>=2.0' 'python2-pkginfo')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('12948245aeb59acf32f663e1d81fed34')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  # Python 2 and 3 can live together.
  mv "${pkgdir}/bin/twine" "${pkgdir}/bin/twine2"
}

# vim:set ts=2 sw=2 et:
