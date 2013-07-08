# Maintainer: bwrsandman <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/linaria

pkgname=linaria
pkgver=38760
pkgrel=1
pkgdesc="A port of Terraria to Linux."
arch=('i686' 'x86_64')
url="http://www.terrariaonline.com/threads/85476"
license=('unknown')

depends=('mono' 'openal')
install=$pkgname.install

source=("${pkgname}.zip::http://www.terrariaonline.com/attachments/${pkgname}-zip.${pkgver}/"
        "${pkgname}.sh"
	"${pkgname}.png::http://hydra-images.cursecdn.com/terraria.gamepedia.com/5/51/Terraria_tree2.png"
	"${pkgname}.desktop")
sha1sums=('c9c9d5c7981e977e32daef74dd926fa57277878f'
          'e484567c11e4df91a707409cc8461b4caa6efcac'
	  '57f49c8c8c92e74b3761db0da00c68a37b84a95a'
	  '4008d5576260f837dd0040411010e04abbe0891c')

package() {
  cd "$srcdir"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -d "$pkgdir/opt/$pkgname"
  install -Dm755 Terraria.exe "$pkgdir/opt/$pkgname"
  install -Dm755 *.mdb "$pkgdir/opt/$pkgname"
  install -Dm755 *.dll "$pkgdir/opt/$pkgname"
  install -Dm755 *.dll.config "$pkgdir/opt/$pkgname"
}
