# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-yapsy
_pyname=Yapsy
pkgver=1.11.123
pkgrel=2
pkgdesc='Yet Another Plugin SYstem'
arch=('any')
url='http://yapsy.sourceforge.net/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
# `b` added upstream
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}b.tar.gz")
md5sums=('7a8934158e9314c4f0f76606d082be8f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
