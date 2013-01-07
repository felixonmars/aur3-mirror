pkgname=craftbukkit-plugin-crazylogin
pkgver=7.7.1
pkgrel=1
pkgdesc="Adds per player passwords to your server."
arch=(any)
url="http://dev.bukkit.org/server-mods/crazylogin/"
license=("Unknown")
depends=("craftbukkit-plugin-crazycore" "craftbukkit>=1.4.2")
conflicts=()
provides=()
replaces=()
source=("http://dev.bukkit.org/media/files/660/659/CrazyLogin.jar")
noextract=("CrazyLogin.jar")
md5sums=('ad38ea7133f496292f1edb81d547f7bc')

package() {
  install -Dm644 "$srcdir/CrazyLogin.jar" "$pkgdir/srv/craftbukkit/plugins/CrazyLogin.jar"
}

# vim:set ts=2 sw=2 et:
