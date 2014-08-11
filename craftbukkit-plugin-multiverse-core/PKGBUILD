pkgname=craftbukkit-plugin-multiverse-core
epoch=1
pkgver=2.5
pkgrel=1
pkgdesc="Multiple world plugin for Bukkit"
arch=(any)
url="https://dev.bukkit.org/server-mods/multiverse-core"
license=("BSD")
depends=("craftbukkit>=1.7.9")
source=("http://dev.bukkit.org/media/files/807/512/Multiverse-Core-2.5.jar")
noextract=("Multiverse-Core-$pkgver.jar")
md5sums=('3848d54650faf2dc24f12459093311c9')

package() {
	install -Dm644 "$srcdir/Multiverse-Core-$pkgver.jar" "$pkgdir/srv/craftbukkit/plugins/Multiverse-Core-$pkgver.jar"
}
