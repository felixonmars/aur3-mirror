# Maintainer: Jonathan Conder <jonno.conder@gmail.com>

pkgname=myththeme-arclight
pkgver=25.12
pkgrel=1
pkgdesc="Arclight theme for MythTV"
arch=('any')
url="http://www.fecitfacta.com"
license=('GPL2' 'custom')
depends=('mythtv')
source=("http://www.fecitfacta.com/Arclight.tar.gz")
sha256sums=('9252e74cb34d17a88bd68a082419c0472d59cbfb69a2d8459c048f835863b510')

build() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/share/mythtv/themes"
  cp -R 'Arclight' "$pkgdir/usr/share/mythtv/themes"

  cd "$pkgdir/usr/share/mythtv/themes/Arclight"
  rm 'svn-commit.tmp'

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname"
}
