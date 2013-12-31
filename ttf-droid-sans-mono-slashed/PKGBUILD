# Maintainer: Tod Davies <davies.t.o@gmail.com>

pkgname=ttf-droid-sans-mono-slashed
pkgver=1.00
pkgrel=1
pkgdesc='droid sans mono font with slashed zeros'
arch=('any')
url=('http://www.cosmix.org/software/')
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
install="${pkgname}.install"
source=(
  'http://www.cosmix.org/software/files/DroidSansMonoSlashed.zip'
)
sha256sums=(
  '71768814dc4de0ea6248d09a2d2285bd47e9558f82945562eb78487c71348107'
)

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 DroidSansMonoSlashed.ttf "${pkgdir}/usr/share/fonts/TTF"  
}