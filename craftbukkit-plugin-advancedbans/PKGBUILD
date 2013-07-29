#Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>
#Maintainer: Lewis "mystax" Hulbert <mystax@wagn.me>
pkgname=craftbukkit-plugin-advancedbans
pkgver=0.81
pkgrel=1
pkgdesc="Advanced ban plugin for Bukkit."
arch=(any)
url="http://dev.bukkit.org/server-mods/advanced-bans/"
license=("GPLv3")
depends=("craftbukkit")
source=("http://dev.bukkit.org/media/files/716/392/AdvancedBans-0.81.jar")
noextract=("AdvancedBans-0.81.jar")
md5sums=('7e794e688009bf3812ff0adf98280fcd')

package() {
  install -Dm644 "$srcdir/AdvancedBans-0.81.jar" "$pkgdir/srv/craftbukkit/plugins/AdvancedBans-0.81.jar"
}

# vim:set ts=2 sw=2 et:
