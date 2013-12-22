# Maintainer: Vincent Post <vincent.post@w1r3.net>
# https://github.com/w1r3/archlinux-packages

pkgname=craftbukkit-plugin-structuresaver
pkgver=1.2
pkgrel=1
pkgdesc="A utility plugin to streamline the saving of structures in Minecraft 1.6.4"
arch=(any)
url="https://github.com/Bukkit/StructureSaver"
license=("GPLv3")
depends=("craftbukkit=1.6.4r2.0")
source=("https://github.com/Bukkit/StructureSaver/releases/download/v1.2/structuresaver-1.2.jar")
sha512sums=('bc8f08f95cc3fea445a0a2fea827c183a749a6bbb20b0190934a4d96bf98c7512de442184246aa3ed41f150b79be0533f6f2aa8e175f1f80c28df00cb8b127d4')

package() {
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{}
}
