# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ttf-halftone
pkgver=1
pkgrel=1
pkgdesc="An ornamental black letter font with half-tone shading"
arch=(any)
url=http://www.moorstation.org/typoasis/designers/lloyd/blackjewels/index.htm
license=(unknown)
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(http://www.moorstation.org/typoasis/designers/lloyd/blackjewels/fonts/halftone.zip)
sha256sums=('c2f021f3e74d0cb64334cbfd93534efafc8a05be0f8168e6ed398773d74aa7ce')
sha512sums=('69a3ae779ae862d562c977a9a050f4735d40a1285527c8e7a623ed4c3e1d3630ff471cde586123091325901f3f9042f50ce82be062b2748e68e056704a05a1bb')

build() {
    install -Dm644 halftone.ttf "$pkgdir"/usr/share/fonts/TTF/halftone.ttf
}
