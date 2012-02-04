# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-defaultpermissions
pkgver=0.3.1
pkgrel=1
pkgdesc="Permissions for default commands"
arch=(any)
url="http://forums.bukkit.org/threads/admn-defaultpermissions-v0-2-make-default-commands-compatible-with-permissions-592-734.11238/"
license=('GPL')
depends=('craftbukkit')
source=('https://github.com/downloads/imjake9/Bukkit-DefPerms/DefaultPermissions.jar')
md5sums=('64bfd76df872dc7c1698ca2dbadddcbc')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins"
  install -m 644 "$srcdir/DefaultPermissions.jar" "$pkgdir/opt/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:
