# Maintainer: Jan Hartmann <snpwr[at]mailbox[dot]org>
pkgname=ttf-redacted
pkgver=0.1.0
pkgrel=1
pkgdesc="A wireframe font for web and desktop."
url="https://github.com/christiannaths/Redacted-Font"
arch=('x86_64' 'i686')
license=('OFLv1.1')
depends=('fontconfig')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/christiannaths/Redacted-Font/archive/89626075c5906f583d1e108c6f236f86163b8eb4.zip")
sha256sums=('020cad105a3719674e6bfa981e2bf4ea3d75cee2cd15573d8a21239372f24962')

package() {
  cd "${srcdir}"
  mv Redacted-Font-* ttf-redacted
  cd "${srcdir}/ttf-redacted/fonts"
  install -Dm644 redacted-regular.ttf "${pkgdir}/usr/share/fonts/TTF/redacted-regular.ttf"
  install -Dm644 redacted-script-bold.ttf "${pkgdir}/usr/share/fonts/TTF/redacted-script-bold.ttf"
  install -Dm644 redacted-script-light.ttf "${pkgdir}/usr/share/fonts/TTF/redacted-script-light.ttf"
  install -Dm644 redacted-script-regular.ttf "${pkgdir}/usr/share/fonts/TTF/redacted-script-regular.ttf"
}

# vim:set ts=2 sw=2 et: