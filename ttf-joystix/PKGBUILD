# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ttf-joystix
pkgver=1
pkgrel=2
pkgdesc="Joystix font, used by datalove.me"
arch=(any)
url=http://typodermicfonts.com/
license=(custom)
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(joystix.zip::http://img.dafont.com/dl/?f=joystix
    LICENSE)
sha256sums=('375e92dae15040453e1fef34dd463c466127fad9eb6545104161a6eb1393c4b2'
    '15869b0ff73926f30a13577b01fb304470761159ed345bd13a8a4027e91618f6')
sha512sums=('7471c466427f6231b5e2aceaa300ac90478adb95a1c6a4a50ca48937304e0564e96f5bc48ea65eb6699836f0cb8c638bec8ca546d5662fb4d891a0ace093634e'
    'b58c4595640394d5c5d123bf25ec42c1505959b34826fefd76a956b0320d676c9176513b90f0007c8c730d413d1f9fa5ce1c8ef283c13f7bbba2aad153874935')

package() {
    install -Dm644 tt/joystix\ monospace.ttf "$pkgdir"/usr/share/fonts/TTF/joystix.ttf
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
