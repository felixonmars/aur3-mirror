# Maintainer: Todd Partridge <http://https://github.com/Gen2ly/archpkgs>

pkgname=power-backlight-git
_pkgname=${pkgname%-*}
pkgver=0.82.0
pkgrel=1
pkgdesc="Set screen backlight brightness dependent on power source type."
arch=("any")
url="https://github.com/Gen2ly/"$_pkgname"/"
license=("GPL2")
depends=("gnome-shell")
makedepends=("git")
conflicts=("")
install=
source=("git://github.com/Gen2ly/"$_pkgname"")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 $_pkgname      "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 $_pkgname.conf "$pkgdir"/etc/default/$_pkgname.conf
  install -Dm644 45-"$_pkgname".rules \
    "$pkgdir"/usr/lib/udev/rules.d/45-"$_pkgname".rules
  install -Dm644 license.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
