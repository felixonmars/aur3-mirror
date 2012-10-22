pkgname=d2x-xl-d1-hires-textures
pkgver=1.5
pkgrel=1
pkgdesc="High resolution textures for Descent 1"
arch=(any)
url="http://www.descent2.de"
license=("Other License, Public Domain")
makedepends=(p7zip)
depends=(d2x-xl)
conflicts=(d2x-xl-d1-medres-textures
d2x-xl-data-d1-hires)
provides=(d2x-xl-d1-medres-textures
d2x-xl-data-d1-hires)
replaces=(d2x-xl-data-d1-hires)
source=("$url/files/textures/D1-hires-ceilings.7z"
"$url/files/textures/D1-hires-doors.7z"
"$url/files/textures/D1-hires-fans-grates.7z"
"$url/files/textures/D1-hires-lava.7z"
"$url/files/textures/D1-hires-lights.7z"
"$url/files/textures/D1-hires-metal.7z"
"$url/files/textures/D1-hires-rock.7z"
"$url/files/textures/D1-hires-signs.7z"
"$url/files/textures/D1-hires-special.7z"
"$url/files/textures/D1-hires-switches.7z")
noextract=("D1-hires-ceilings.7z"
"D1-hires-doors.7z"
"D1-hires-fans-grates.7z"
"D1-hires-lava.7z"
"D1-hires-lights.7z"
"D1-hires-metal.7z"
"D1-hires-rock.7z"
"D1-hires-signs.7z"
"D1-hires-special.7z"
"D1-hires-switches.7z")
md5sums=('524bcce5b81b15df85bb7a2072dd64e0'
         'e7fe65cdbceb46f6e1bc188345f6bc70'
         '48d68b07d20f600bf9cdb0aec71744e2'
         'a459f86c5f73892d68436493e98b4ec2'
         'ca31e93dd5095c2b3b92e44bd763cfb5'
         'f85e739ed22132062f21a9eb8758365b'
         '7f8e2f617b4f5fdb8333b4e18bfa418a'
         'a452871469fb53031754f8b58e754bb7'
         'e9c4c3a87b7dbcd2adb345c8db57b3d3'
         '67942b88461ed313942cc27b60ea0a50')

package() {
  mkdir -p "$pkgdir/usr/local/games/d2x-xl"
  find . -name '*.7z' | xargs -rtl1 -I {} 7za x -y {} -o"$pkgdir/usr/local/games/d2x-xl"
  chmod -R 755 "$pkgdir/usr/local/games/d2x-xl"
}
# vim:syntax=sh
