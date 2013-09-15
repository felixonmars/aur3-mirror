# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ttf-graveo
pkgver=1.0
pkgrel=1
pkgdesc="Manuscript font"
arch=(any)
url=http://e17-stuff.org/content/show.php/Graveo%27s+manuscript+font?content=83167
license=(GPL)
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(http://www.e17-stuff.org/CONTENT/content-files/83167-Graveo.ttf)
sha256sums=('3f0d74a72d364f8f5b23e46d73e585d8397c763c1b691cacb931e63018b13307')
sha512sums=('a277173fbfff0d3e4db4f027de12cc2735200c81faa825b6739615453fadbb9332b43036b18ec3ff64908a9661d33340f553141a948187e921ecf26c3d177db1')

package() {
    install -Dm644 83167-Graveo.ttf "$pkgdir"/usr/share/fonts/TTF/graveo.ttf
}
