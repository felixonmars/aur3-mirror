pkgname=d2x-xl-hires-sounds
pkgver=1.5
pkgrel=1
pkgdesc="All Descent 1 and 2 sounds resampled to 44 khz."
arch=(any)
url="http://www.descent2.de"
license=("Other License, Public Domain")
makedepends=(p7zip)
depends=(d2x-xl)
source=("$url/files/sound/hires-sounds.7z")
noextract=("hires-sounds.7z")
md5sums=('b21223cae8b2b692d267234e55fc7e9a')

package() {
  mkdir -p "$pkgdir/usr/local/games/d2x-xl"
  find . -name '*.7z' | xargs -rtl1 -I {} 7za x -y {} -o"$pkgdir/usr/local/games/d2x-xl"
  chmod -R 755 "$pkgdir/usr/local/games/d2x-xl"
}
# vim:syntax=sh
