pkgname=craftbukkit-plugin-craftbook
epoch=1
pkgver=3.9b4
pkgrel=1
pkgdesc="Plugin that allows you to build interactive mechanisms, integrated circuits and more..."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/craftbook"
license=("GPLv3")
makedepends=(dos2unix)
depends=(craftbukkit-plugin-worldedit "craftbukkit>=1.7.9")
source=("http://dev.bukkit.org/media/files/810/364/CraftBook_3.9b4.zip")
md5sums=('e48a12bda76d015f953b15d0f89ab255')

prepare() {
	find $srcdir -type f -exec dos2unix {} \;
}

package() {
	install -Dm 644 -g craftbukkit -o craftbukkit "$srcdir/CraftBook.jar" "$pkgdir/srv/craftbukkit/plugins/CraftBook.jar"
	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:


