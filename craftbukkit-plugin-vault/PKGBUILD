pkgname=craftbukkit-plugin-vault
pkgver=1.2.22
pkgrel=1
pkgdesc="Vault is a Permissions, Chat, & Economy API."
arch=(any)
url="http://dev.bukkit.org/server-mods/vault/"
license=("GPL v3")
depends=("craftbukkit>=1.4.2")
conflicts=()
provides=()
replaces=()
source=("http://dev.bukkit.org/media/files/656/592/Vault.jar")
noextract=("Vault.jar")
md5sums=('4b6de39337fdc7c47b46f315dbdae380')

package() {
  install -Dm644 "$srcdir/Vault.jar" "$pkgdir/srv/craftbukkit/plugins/Vault.jar"
}

# vim:set ts=2 sw=2 et:
