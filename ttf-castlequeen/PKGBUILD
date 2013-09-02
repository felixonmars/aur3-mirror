# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ttf-castlequeen
pkgver=1
pkgrel=1
pkgdesc="A hand-drawn, sketchy, cursive style font"
arch=(i686 x86_64)
url=http://www.cuttyfruty.com/enhtml/fonts.php
license=('Free for personal use')
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(http://www.cuttyfruty.com/html/fonts/Jellyka_Castel_s_Queen.zip)
sha256sums=('0cddde936352a328a06e1e6d1e51487c156a6bfa813cb6d70b05b54884a70d62')
sha512sums=('a1065269100b4d57c119ce957fb270fbe912d8820e1193fc698c68bcf8df89457b4b82b7c55ee2ff72c4101e6fcb5dc369c83ff73d34eca56322bdaa1280c0f5')

package() {
    install -Dm644 "Jellyka_Castle's_Queen.ttf" "$pkgdir"/usr/share/fonts/TTF/castlequeen.ttf
}
