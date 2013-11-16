# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=python-unidecode
_pyname=Unidecode
pkgver=0.04.14
pkgrel=1
pkgdesc='ASCII transliterations of Unicode text'
arch=('any')
url='http://pypi.python.org/pypi/Unidecode/'
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/$(echo ${_pyname} | cut -c1)/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d4106bcfdef39625944f4294ef4666de')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
