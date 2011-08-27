# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-griefalertr-permissions
pkgver=0.761
pkgrel=1
pkgdesc="Grief warning plugin for Bukkit with Permissions support"
arch=(any)
url="http://forums.bukkit.org/threads/sec-griefalert-reborn-0-75-supports-both-group-manager-and-permissions-684.6399/"
license=('GPL')
depends=('craftbukkit')
install=craftbukkit-plugin-griefalertr-permissions.install
source=('http://instinctgamers.com/minecraft/GriefAlertRPM.zip')
md5sums=('47c4386a90be24ab95a5a15647a8ddc4')


package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins/GriefAlertR/logs" 
  install -m 644 "$srcdir/plugins/GriefAlertR.jar" "$pkgdir/opt/craftbukkit/plugins/"
  install -m 644 "$srcdir/plugins/GriefAlertR/config.txt" "$pkgdir/opt/craftbukkit/plugins/GriefAlertR"
  install -m 644 "$srcdir/install.sql" "$pkgdir/opt/craftbukkit/plugins/GriefAlertR"
  install -m 644 "$srcdir/mysql-connector-java-bin.jar" "$pkgdir/opt/craftbukkit"
}

# vim:set ts=2 sw=2 et:
