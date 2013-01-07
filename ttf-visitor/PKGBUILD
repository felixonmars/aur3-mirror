# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ttf-visitor
pkgver=1.0
pkgrel=2
pkgdesc="Visitor 1 and 2 are low-resolution monospaced sans fonts that are the de facto standard for userbars."
arch=(any)
url=http://www.dafont.com/font.php?file=visitor
depends=(fontconfig xorg-font-utils)
source=($pkgname.zip::http://img.dafont.com/dl/?f=visitor
    LICENSE)
license=(custom)
install=$pkgname.install
sha256sums=('cd63de4f3f68b0be6eb7b27e3c9e1ff78da41dae1a0fc69d29da07498c70010e'
    'a37aefa7fdb0393a592bde1f68da176791307de8af0f94a39ba9de6c5d56f659')
sha512sums=('9c0cd1be2334ef36cd85f2f630e55a5aae33c8b25aebcf71f18851aa93962ab42ef19b980801a4bcfad62d3817d79b18b91b8357043f94e56527927674d3eb64'
    '85e887cd3e9cd9b92b45ebb8ac337f1a97dd90bb71853997fdea0f4c70f0e004867a8e7febadc64709fcae626b9e96e23af483d854ea9ddb777d2c36ebb051d0')

package() {
    install -d "$pkgdir"/usr/share/fonts/TTF/
    cp "$srcdir"/visitor{1,2}.ttf "$pkgdir"/usr/share/fonts/TTF/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
