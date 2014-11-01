pkgname=spigot-plugin-carbon
epoch=2
pkgver=1.7
pkgrel=1
pkgdesc="Carbon is a Spigot plugin which adds 1.8 blocks and features into a spigot protocol hacked server."
arch=(any)
url="http://www.spigotmc.org/resources/carbon.1258"
license=("GPLv3")
depends=(spigot-plugin-protocollib)
source=("http://build.true-games.org/job/Carbon/lastStableBuild/artifact/target/Carbon.jar")
noextract=("Carbon.jar")
md5sums=('SKIP')

package() {
	install -Dm 644 -g craftbukkit -o craftbukkit "$srcdir/Carbon.jar" "$pkgdir/srv/craftbukkit/plugins/Carbon.jar"
}
# vim:set ts=2 sw=2 et:
