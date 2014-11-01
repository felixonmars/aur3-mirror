pkgname=spigot-plugin-protocollib
pkgver=3.6.0
pkgrel=1
pkgdesc="A version of ProtocolLib that is compatible with the new 1.8.0 compatible build of Spigot."
arch=(any)
url="http://assets.comphenix.net/job/ProtocolLib%20-%20Spigot%20Compatible%201.8"
license=("GPLv3")
depends=(spigot-update)
source=("http://assets.comphenix.net/job/ProtocolLib%20-%20Spigot%20Compatible%201.8/lastStableBuild/artifact/ProtocolLib/target/ProtocolLib-Spigot-3.6.0-SNAPSHOT.jar")
noextract=("ProtocolLib-Spigot-3.6.0-SNAPSHOT.jar")
md5sums=('SKIP')

package() {
	install -Dm 644 -g craftbukkit -o craftbukkit "$srcdir/ProtocolLib-Spigot-3.6.0-SNAPSHOT.jar" "$pkgdir/srv/craftbukkit/plugins/ProtocolLib-Spigot.jar"
}
# vim:set ts=2 sw=2 et:
