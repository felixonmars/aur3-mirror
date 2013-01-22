# Maintainer: Nowaker <spam@nowaker.net>
# Contributor: kfgz <kfgz at interia pl>

pkgname='scimark2-java'
pkgver='1'
pkgrel='1'
pkgdesc='Benchmark for scientific and numerical computing. Java version.'
arch=('i686' 'x86_64')
url='http://math.nist.gov/scimark2/index.html'
license=('custom')
depends=('java-runtime')
_jar='scimark2lib.jar'
source=('license' "${pkgname}" "http://math.nist.gov/scimark2/${_jar}")
noextract=("${_jar}")
md5sums=('dbd2f4858a55ff731ba6f61ca9af1222'
         'e0c50ac4d9b6a49c2fac9e642216efaa'
         'e90a3b88b66d8efa9bdc4bff76f370b1')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${_jar}" "${pkgdir}/usr/share/java/${pkgname}/${_jar}"
  install -Dm644 'license' "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
