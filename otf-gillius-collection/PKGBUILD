# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=otf-gillius-collection
pkgver=20110312
pkgrel=2
pkgdesc="Alternative font for GillSans MT"
arch=(any)
url=http://arkandis.tuxfamily.org/adffonts.html
license=(GPL)
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
install=$pkgname.install
source=(http://arkandis.tuxfamily.org/fonts/Gillius-Collection-20110312.zip)
sha256sums=('a74f1c9ecbdeb4751ac410f77dbe7210379dc87300c7a3afa19dcc354513f0bd')
sha512sums=('ecfb23306895189a96f3ac944209dc8e3573cc3b6bfead261a80d5dfb7b8e2cb83c58e5dd42e0b3db6ace09076736a948842284d29c13a7c75d6e915fb0a84f7')

package() {
  cd Gillius-Collection-20110312/OTF/
  install -d "$pkgdir"/usr/share/fonts/OTF/$pkgname/
  cp *.otf "$pkgdir"/usr/share/fonts/OTF/$pkgname/
}
