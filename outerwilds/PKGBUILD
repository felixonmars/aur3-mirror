# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
pkgname=outerwilds
pkgdesc='A space exploration game in a time-looping universe'
url='http://outerwilds.com/'
pkgver=Alpha_1_2
pkgrel=1
license=('custom')
arch=('i686' 'x86_64')
depends=('glu' 'mesa' 'libxcursor')
[[ "${CARCH}" == 'x86_64' ]] && depends+=('lib32-glu' 'lib32-mesa' 'lib32-libxcursor')
source=("http://alexbeachum.com/outerwilds/OuterWilds_${pkgver}_Linux.zip"
        'outerwilds.desktop')
sha256sums=('5c7defadfd42368402d95a1da9f753e1dcb8e50ef184801718fa8cb13780f05a'
            'b251fcee6315ba1a518d4bbfc1560914687493d4b5355f8e59ecd546914246c5')

package() {
  cd "${srcdir}"

  _installdir="opt/${pkgname}"
  install -d -m755 "${pkgdir}"/{usr/bin,"${_installdir}"}
  install -m755 "OuterWilds_${pkgver}" "${pkgdir}/${_installdir}/"

  ln -s "/${_installdir}/OuterWilds_${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a --no-preserve=ownership "OuterWilds_${pkgver}_Data" "${pkgdir}/${_installdir}/"

  install -Dm644 "${srcdir}/outerwilds.desktop" "${pkgdir}/usr/share/applications/outerwilds.desktop"
}

