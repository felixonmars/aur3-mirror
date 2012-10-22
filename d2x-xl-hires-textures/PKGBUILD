pkgname=d2x-xl-hires-textures
pkgver=1.5
pkgrel=1
pkgdesc="Shared high resolution textures for Descent 1 and 2"
arch=(any)
url="http://www.descent2.de"
license=("Other License, Public Domain")
makedepends=(p7zip)
depends=(d2x-xl)
source=("$url/files/textures/hires-missiles.7z"
"$url/files/textures/hires-powerups.7z"
"$url/files/textures/hires-effects.7z")
noextract=("hires-sounds.7z"
"hires-powerups.7z"
"hires-effects.7z")
md5sums=('511b84039b52aecdc1ff742acb571328'
         '107d3c4cde67fece104b6e28ce22fae4'
         '626b0ba10ed07bca8477e93c73be9f09')

package() {
  mkdir -p "$pkgdir/usr/local/games/d2x-xl"
  find . -name '*.7z' | xargs -rtl1 -I {} 7za x -y {} -o"$pkgdir/usr/local/games/d2x-xl"
  chmod -R 755 "$pkgdir/usr/local/games/d2x-xl"
}
# vim:syntax=sh
