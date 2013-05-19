# Maintainer: agaric <binzter_at_gmail_dot_com>

pkgname=ttf-agave
pkgver=8
pkgrel=2
pkgdesc='A monospaced outline font for coding and the commandline'
arch=('any')
url=('https://bitbucket.org/agaric/agave')
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
install="${pkgname}.install"
source=(
  'https://bitbucket.org/agaric/agave/downloads/agave-008a.tar.gz'
  'license.txt'
)
sha256sums=(
  '7ec0db9e6779fbb2c873543bd12dde95e120ce4b8e9973e96432e3a943caba7d'
  'bac7b465f9d91361afb78601d924b34aee7d81e0a9a633d89c0afc969ab243cf'
)

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 agave-[rbiz].ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
