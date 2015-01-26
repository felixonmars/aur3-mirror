pkgname=spigot-bare
pkgver=1.8_R0.1
pkgrel=1
pkgdesc="High performance Minecraft server implementation"
arch=(any)
url="http://www.spigotmc.org"
license=("LGPL")
depends=(java-runtime-headless fontconfig)
makedepends=(java-environment git)
conflicts=(bukkit craftbukkit spigot-patcher spigot)
provides=(bukkit "craftbukkit=${pkgver%_*}" spigot)
source=("https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar")
noextract=("BuildTools.jar")
md5sums=("SKIP")

build() {
	cd "$srcdir"
	java -jar BuildTools.jar
}

package() {
  install -Dm644 "$srcdir/Spigot/Spigot-Server/target/spigot-${pkgver//_/-}-SNAPSHOT.jar" "$pkgdir/opt/spigot/spigot.jar"
}
