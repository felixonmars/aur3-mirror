# Maintainer: Daniel Aleksandersen <code@daniel.priv.no>
pkgname=fluxfonts
pkgver=1.1
pkgrel=2
pkgdesc='Continual random font generator for increased privacy'
arch=('i686' 'x86_64' 'armhf')
url='https://www.aeyoun.priv.no/p/fluxfonts/intro.html'
license=('MIT')
optdepends=('words: use real words as font family names')
source=("${pkgname}.service" "https://www.aeyoun.priv.no/p/fluxfonts/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2001351e1b469751937297b8b8d814ee1115ec65351ba0172499bed3853d5f7c89ce4ae2de029eb62debe12770f0ccb173b11e57ecda03e8576a55984c37b10a' '41964a34e6f80a005f00be5b79d385ea72727c1cb5d2e38ecc2eb1a5fe3e670c1c55e3ee9c4058913e54d1fb3fc22877eb25e7914424e0f3088801524b46fdd5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
