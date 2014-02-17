pkgname=liteloader
pkgver=1.7.2_04
pkgrel=1
pkgdesc="LiteLoader is a lightweight bootstrap designed to give base-clean Minecraft mods a way of hooking into the game without having to use one of the more heavyweight mod API's"
arch=(any)
url="https://www.assembla.com/spaces/liteloader/wiki"
license=("custom")
depends=(java-runtime)
source=("http://dl.liteloader.com/redist/${pkgver%_*}/liteloader-installer-${pkgver//_/-}.jar"
"liteloader.sh")
noextract=("liteloader-installer-${pkgver//_/-}.jar")
md5sums=('f7a498fc6261ac3657167b2d9f03732a'
         '4c0b24d68be74b69b2b128abd13d96b3')

package() {
  install -Dm644 "$srcdir/liteloader-installer-${pkgver//_/-}.jar" "$pkgdir/usr/share/java/liteloader-installer.jar"
  install -Dm755 "$srcdir/liteloader.sh" "$pkgdir/usr/bin/liteloader"
}

# vim:set ts=2 sw=2 et:
