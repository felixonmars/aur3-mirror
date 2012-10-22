pkgname=d2x-xl-d2-hires-textures
pkgver=1.5
pkgrel=1
pkgdesc="High resolution textures for Descent 2"
arch=(any)
url="http://www.descent2.de"
license=("Other License, Public Domain")
makedepends=(p7zip)
depends=(d2x-xl)
conflicts=(d2x-xl-d2-medres-textures
d2x-xl-data-d2-hires)
provides=(d2x-xl-d2-medres-textures
d2x-xl-data-d2-hires)
replaces=(d2x-xl-data-d2-hires)
source=("$url/files/textures/D2-hires-ceilings.7z"
"$url/files/textures/D2-hires-doors.7z"
"$url/files/textures/D2-hires-fans-grates.7z"
"$url/files/textures/D2-hires-lava-water.7z"
"$url/files/textures/D2-hires-lights.7z"
"$url/files/textures/D2-hires-metal.7z"
"$url/files/textures/D2-hires-rock.7z"
"$url/files/textures/D2-hires-signs.7z"
"$url/files/textures/D2-hires-special.7z"
"$url/files/textures/D2-hires-switches.7z")
noextract=("D2-hires-ceilings.7z"
"D2-hires-doors.7z"
"D2-hires-fans-grates.7z"
"D2-hires-lava-water.7z"
"D2-hires-lights.7z"
"D2-hires-metal.7z"
"D2-hires-rock.7z"
"D2-hires-signs.7z"
"D2-hires-special.7z"
"D2-hires-switches.7z")
md5sums=('c6118cacc574b67be6f88d393cb395d9'
         'c0810e901c280a6ea8561d8ff3943762'
         '1cb96d5285b07a99c1a71bf4d05ffa10'
         '458dc05222e8f5194ace126d487552f3'
         '583a6f8b17e221694637833bdceef003'
         '8c1180b6ee0dbf6aad46721336c0809d'
         '1a3d6a74efb2636af9f7695939e0c53d'
         '9aba333975599ceef8a5cedbc698884b'
         'cb7346ffa321b5cf75f88ded134cc200'
         'b6b137b9b844c0184ef7116ea10c3a28')

package() {
  mkdir -p "$pkgdir/usr/local/games/d2x-xl"
  find . -name '*.7z' | xargs -rtl1 -I {} 7za x -y {} -o"$pkgdir/usr/local/games/d2x-xl"
  chmod -R 755 "$pkgdir/usr/local/games/d2x-xl"
}
# vim:syntax=sh
