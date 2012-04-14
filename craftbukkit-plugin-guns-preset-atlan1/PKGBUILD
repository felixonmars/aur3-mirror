pkgname=craftbukkit-plugin-guns-preset-atlan1
pkgver=1
pkgrel=2
pkgdesc="Guns+ configuration files with pre-made gun set"
url="http://dev.bukkit.org/server-mods/guns/"
arch=(any)
license=('unknown')
backup=("opt/craftbukkit/plugins/Guns_/ammo.yml"
"opt/craftbukkit/plugins/Guns_/general.yml"
"opt/craftbukkit/plugins/Guns_/guns.yml"
"opt/craftbukkit/plugins/Guns_/recipes.yml")
depends=('craftbukkit-plugin-guns')
conflicts=(craftbukkit-plugin-spout-gunpack-atlan1)
provides=(craftbukkit-plugin-spout-gunpack-atlan1)
source=("http://dl.dropbox.com/u/44243469/GunPack/GunPack.zip")
md5sums=('b1e08de606d54e4ae7b4c791fd7acd93')

package() {
	mkdir -p "$pkgdir/opt/craftbukkit/plugins/Guns_"
	install -m 644 "$srcdir/ammo.yml" "$pkgdir/opt/craftbukkit/plugins/Guns_"
	install -m 644 "$srcdir/general.yml" "$pkgdir/opt/craftbukkit/plugins/Guns_"
	install -m 644 "$srcdir/guns.yml" "$pkgdir/opt/craftbukkit/plugins/Guns_"
	install -m 644 "$srcdir/recipes.yml" "$pkgdir/opt/craftbukkit/plugins/Guns_"
}
