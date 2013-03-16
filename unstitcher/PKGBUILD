pkgname=unstitcher
pkgver=1
pkgrel=2
pkgdesc="Converts Minecraft texture packs into 1.5 format"
arch=(any)
url="http://www.minecraftwiki.net/wiki/Texture_Packs#Textures_for_Blocks_and_Items_in_Minecraft_1.5"
license=("unknown")
makedepends=(java-runtime)
depends=(java-runtime)
source=("http://assets.minecraft.net/unstitcher/unstitcher.jar"
"unstitcher"
"unstitcher.desktop")
noextract=("unstitcher.jar")
md5sums=('1efde12025278a930d508c66482b34c0'
         '15bd40800c4f3e8f43114ffe0197b2a8'
         'c87122a5243fdb1d25a36657d1c326ce')

package() {
  install -Dm644 "$srcdir/unstitcher.jar" "$pkgdir/usr/lib/unstitcher/unstitcher.jar"
  install -Dm755 "$srcdir/unstitcher" "$pkgdir/usr/bin/unstitcher"
  install -Dm644 "$srcdir/unstitcher.desktop" "$pkgdir/usr/share/applications/unstitcher.desktop"
}

# vim:set ts=2 sw=2 et:
