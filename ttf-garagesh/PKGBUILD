# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ttf-garagesh
pkgver=1
pkgrel=1
pkgdesc="A blocky, outline, graffiti style font"
arch=(any)
url=http://www.moorstation.org/typoasis/typoasis1.htm
license=(unknown)
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(http://www.moorstation.org/typoasis/graffiti/p2/garagesh.zip)
sha256sums=('716082638f2efa438131bdf336a74b128e6f032fdd135dc745e4f9e300d21102')
sha512sums=('093107beac076c618871cde2534781d588528993815c94e1b563268e5cc7b1c27fd85e0f20c52d500113d693080e80c48a87e9cb23b1aed07a9180532e95c386')

package() {
    install -Dm644 garagesh.ttf "$pkgdir"/usr/share/fonts/TTF/garagesh.ttf
}
