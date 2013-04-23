#Maintainer: CIppaciong <lacapannadelloziotom [at] gmail [dot] com>

pkgname=cld-icon-theme
pkgver=1.0
pkgrel=2
pkgdesc="Icon theme for KDE. The abandoned old known as Caledonia Icons"
arch=('any')
url="http://sourceforge.net/projects/cldicons/"
license=('C-BY; CC-BY-SA')
depends=('kdebase-workspace')
makedepends=()
source=(http://sourceforge.net/projects/cldicons/files/Icon%20theme/CLD-Icons.tar.gz)
sha256sums=('ee0febad7ee019087b78fa23634f253fb5f1687d7741907dd5b0f37a3a100da8')

package() {
cd $srcdir/
install -d $pkgdir/usr/share/icons/
cp -R CLD-Icons $pkgdir/usr/share/icons/
chmod -R 755 $pkgdir/usr/share/icons/
}
