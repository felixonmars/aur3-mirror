# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=python2-oletools
_pyname=oletools
pkgver=0.09
pkgrel=1
pkgdesc="package of python tools to analyze Microsoft OLE2 files"
url="http://www.decalage.info/olefile"
arch=('any')
depends=('python2')
license=('BSD')
source=("https://pypi.python.org/packages/source/o/oletools/${_pyname}-${pkgver}.tar.gz")
sha512sums=('d6078d3015c47c63eee7175c3ef8768fb910a09058f2473266f6d51d6884dc4c8a375cba2a0f6cf06684575b8caae6894f53a794b2123538c5f939d699f2d4ea')

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp ${_pyname}/doc/* "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

