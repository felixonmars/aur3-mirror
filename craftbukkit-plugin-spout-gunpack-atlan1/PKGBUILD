pkgname=craftbukkit-plugin-spout-gunpack-atlan1
pkgver=1
pkgrel=1
pkgdesc="GunPack configuration files with pre-made gun set"
url="http://forums.bukkit.org/threads/mech-fun-gunpack-v1-6-create-your-very-own-guns-spout-1-1-r3.57768/"
arch=(any)
license=('unknown')
backup=(opt/craftbukkit/plugins/GunPack/ammo.yml
opt/craftbukkit/plugins/GunPack/general.yml
opt/craftbukkit/plugins/GunPack/guns.yml
opt/craftbukkit/plugins/GunPack/recipes.yml)
depends=('craftbukkit-plugin-spout-gunpack')
source=("http://dl.dropbox.com/u/44243469/GunPack/GunPack.zip")
md5sums=('fbcf1d4d13cfe30088ba8466a6b9d6ba')

package() {
	mkdir -p "$pkgdir/opt/craftbukkit/plugins/GunPack"
	install -m 644 "$srcdir/ammo.yml" "$pkgdir/opt/craftbukkit/plugins/GunPack"
	install -m 644 "$srcdir/general.yml" "$pkgdir/opt/craftbukkit/plugins/GunPack"
	install -m 644 "$srcdir/guns.yml" "$pkgdir/opt/craftbukkit/plugins/GunPack"
	install -m 644 "$srcdir/recipes.yml" "$pkgdir/opt/craftbukkit/plugins/GunPack"
}
