# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: James Feng Cao

pkgname=pdfminer
pkgver=20140328
pkgrel=1
pkgdesc="python utils to extract, analyze text data of PDF files."
arch=('any')
url="http://www.unixuser.org/~euske/python/pdfminer/"
license=('MIT/X')
groups=()
depends=('python2')
backup=()
options=()
install=
source=("http://pypi.python.org/packages/source/p/pdfminer/${pkgname}-${pkgver}.tar.gz")

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install --home=${pkgdir}/usr
  mkdir -p ${pkgdir}/usr/lib/$(python2-config --libs | sed 's/.*\(python.*\)/\1/g')/site-packages
  mv ${pkgdir}/usr/lib/python/* ${pkgdir}/usr/lib/$(python2-config --libs | sed 's/.*\(python.*\)/\1/g')/site-packages
  rm -rf ${pkgdir}/usr/lib/python
}
sha256sums=('ba187b93056586a14edd5e630cf63ae96b1cc84b611f55dcddbc997316d9f262')
