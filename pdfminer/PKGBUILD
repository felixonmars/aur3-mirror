# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: James Feng Cao

pkgname=pdfminer
pkgver=20131113
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
sha256sums=('1016246265f9d48645229164ef44483e9b9a1b3e6902783782f9ae4e1024ea19')
