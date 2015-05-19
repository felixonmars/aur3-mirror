# Maintainer : Dev Brush Technology <feedback@devbrush.com>

pkgname=latchbox
pkgver=1.1.3.2
pkgrel=4
pkgdesc='A Console Based Password Management Program'
arch=('any')
url='https://github.com/DevBrush/latchbox'
license=('BSD')
makedepends=('git' 'go')
optdepends=('xclip: provides clipboard functionality')
source=("latchbox::git+git://github.com/DevBrush/latchbox")
sha512sums=('SKIP')
build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/doc/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/THIRD-PARTY-LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES"
}
