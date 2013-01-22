# Maintainer: Nowaker <spam@nowaker.net>
# Contributor: kfgz <kfgz at interia pl>

pkgname='scimark2'
pkgver='1c'
pkgrel='2'
pkgdesc='Benchmark for scientific and numerical computing. ANSI C version.'
arch=('i686' 'x86_64')
url="http://math.nist.gov/scimark2/index.html"
license=('custom')
source=('license' "http://math.nist.gov/${pkgname}/${pkgname}_${pkgver}.zip")
md5sums=('dbd2f4858a55ff731ba6f61ca9af1222' 
         '6cc8d6d5312a07e32316c03580e0206b')

build() {
  cd "${srcdir}"
  make
}

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 'README' "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 'license' "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
