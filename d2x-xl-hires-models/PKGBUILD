pkgname=d2x-xl-hires-models
pkgver=1.5
pkgrel=1
pkgdesc="Hires Pyro, missiles and smart mines."
arch=(any)
url="http://www.descent2.de"
license=("Other License, Public Domain")
makedepends=(p7zip)
depends=(d2x-xl)
conflicts=(d2x-xl-ship-pyrogl
d2x-xl-ship-phantomxl)
provides=(d2x-xl-ship-pyrogl
d2x-xl-ship-phantomxl)
source=("$url/files/models/hires-models.7z")
noextract=("hires-models.7z")
md5sums=('7553bacc5cb2aee034e16291397e9032')

package() {
  mkdir -p "$pkgdir/usr/local/games/d2x-xl"
  find . -name '*.7z' | xargs -rtl1 -I {} 7za x -y {} -o"$pkgdir/usr/local/games/d2x-xl"
  chmod -R 755 "$pkgdir/usr/local/games/d2x-xl"
}
# vim:syntax=sh
