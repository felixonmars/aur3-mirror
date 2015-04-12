# Maintainer: William Berglund <williamberraberglund@gmail.com>
pkgname=python-blinker
_pyname=blinker
pkgver=1.3
pkgrel=1
pkgdesc='Fast, simple object-to-object and broadcast signaling'
arch=('any')
url='http://pythonhosted.org/blinker/'
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('66e9688f2d287593a0e698cd8a5fbc57')

package() {

  install -D -m644 "${srcdir}/${_pyname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

}
# vim:set ts=2 sw=2 et:
