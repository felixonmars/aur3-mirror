# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pkgname=papilio-udev
pkgver=0.0.1
pkgrel=1
pkgdesc="Udev rules for Papilio"
url="https://aur.archlinux.org/packages/papilio-udev/"
arch=('any')
license=('MIT')
depends=('systemd')
source=('51-papilio.rules')
md5sums=('5d3d8d01f2909b8470b316f3a091b6aa')

package() {
  mkdir -p $pkgdir/usr/lib/udev/rules.d/
  cp 51-papilio.rules $pkgdir/usr/lib/udev/rules.d/
  chmod a+r $pkgdir/usr/lib/udev/rules.d/51-papilio.rules
}

# vim:set ts=2 sw=2 et:
