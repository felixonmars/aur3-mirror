pkgname=d2x-xl-d1-medres-textures
pkgver=1.5
pkgrel=1
pkgdesc="Medium resolution Descent 1 texture pack"
arch=(any)
url="http://www.descent2.de"
license=("Other License, Public Domain")
makedepends=(p7zip)
conflicts=(d2x-xl-data-d1-hires)
provides=(d2x-xl-data-d1-hires)
source=("$url/files/textures/D1-medres-textures.7z")
noextract=("D1-medres-textures.7z")
md5sums=('c9ce22b1e1bb60fa73f07a653c883cda')

package() {
  mkdir -p "$pkgdir/usr/local/games/d2x-xl"
  7za x -y "D1-medres-textures.7z" -o"$pkgdir/usr/local/games/d2x-xl"
  chmod -R 755 "$pkgdir/usr/local/games/d2x-xl"
}
# vim:syntax=sh
