# Maintainer: Félix Saparelli <aur@passcod.name>
# Contributor: Tommaso Sardelli <lacapannadelloziotom@gmail.com>
pkgname=slk
pkgver=1.0.1
pkgrel=2
pkgdesc="Slack chrome-less wrapper"
arch=("any")
url="https://github.com/passcod/slk"
license=("Public Domain")
depends=("node-webkit")
source=("https://github.com/passcod/slk/releases/download/v${pkgver}/slk-${pkgver}-all.nw")
noextract=("slk-${pkgver}-all.nw")
sha512sums=("fc49a3fe316bc095ead42f05c64230af9fc0735b979975f553f95b71b12379d4f33e0b9834cc39dd4afaa422148bc3498a1499326c9e907113c7090927ee984d")

build() {
  cd $srcdir
  cp slk-${pkgver}-all.nw assets.zip
  unzip assets.zip
}

package() {
  cd $srcdir
  install -Dm644 slk-${pkgver}-all.nw $pkgdir/opt/slk/slk.nw
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/slk/LICENSE
  install -Dm644 icon.png $pkgdir/usr/share/pixmaps/slk.png
  install -Dm755 releng/arch/slk $pkgdir/usr/bin/slk
  install -Dm644 releng/arch/slk.desktop $pkgdir/usr/share/applications/slk.desktop
}
