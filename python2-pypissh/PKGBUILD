# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=python2-pypissh
_pyname=pypissh
pkgver=1.4
pkgrel=1
pkgdesc='PyPI SSH Access'
arch=('any')
url='https://pypi.python.org/pypi/pypissh'
license=('custom')
depends=('python2')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/$(echo ${_pyname} | cut -c1)/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ece5d05408d46aba2513dad51b40359c')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
