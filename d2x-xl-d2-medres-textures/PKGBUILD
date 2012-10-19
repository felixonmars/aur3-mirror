pkgname=d2x-xl-d2-medres-textures
pkgver=1.5
pkgrel=1
pkgdesc="Medium resolution Descent 2 texture pack"
arch=(any)
url="http://www.descent2.de"
license=("Other License, Public Domain")
makedepends=(p7zip)
conflicts=(d2x-xl-data-d2-hires)
provides=(d2x-xl-data-d2-hires)
source=("$url/files/textures/D2-medres-textures.7z")
noextract=("D2-medres-textures.7z")
md5sums=('52be2ebffac651d8ee5dbcfbce888d3f')

package() {
  mkdir -p "$pkgdir/usr/local/games/d2x-xl"
  7za x -y "D2-medres-textures.7z" -o"$pkgdir/usr/local/games/d2x-xl"
  chmod -R 755 "$pkgdir/usr/local/games/d2x-xl"
}
# vim:syntax=sh
