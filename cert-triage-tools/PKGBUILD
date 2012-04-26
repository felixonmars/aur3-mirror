pkgname=cert-triage-tools
_pkgname=CERT_triage_tools
pkgver=1.0
pkgrel=1
pkgdesc="A tool to introduce !explitable like functionality to GDB"
arch=('any')
url="https://www.cert.org/blogs/certcc/2012/04/cert_triage_tools_10.html"
license=('CERT')
depends=('python2' 'gdb')
checkdepends=('python2' 'gdb')
options=(!strip)
source=(https://www.cert.org/download/triage/$_pkgname-$pkgver.tar.gz)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/exploitable/tests
  make
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 triage.py $(find exploitable/tests/bin -type f)
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/exploitable
  install -d -m755 ${pkgdir}/usr/share/gdb/python/lib
  install -m644 exploitable.py ${pkgdir}/usr/share/gdb/python/
  install -m644 lib/*.py ${pkgdir}/usr/share/gdb/python/lib/
  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ../license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

sha512sums=('595f4bb70b7017aef713673c7105e17783069fe007423954e23e8012cbfb1b06e2c273bb119fa1819ba0996e016ab1f66678aa9a0f02b279c80e6c477f237104')
