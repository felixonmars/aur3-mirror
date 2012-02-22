# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=keymap-jp106-capsctrl
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="modified jp106 console keymap to change caps to ctrl"
arch=(any)
url="http://example.com/dummy-url/"
license=('GPL')
depends=(kbd)
source=(jp106_capsctrl.map.gz)
noextract=(jp106_capsctrl.map.gz)

check() {
  return 0
}

package() {
  cd $srcdir
  install -D -m644 jp106_capsctrl.map.gz ${pkgdir}/usr/share/kbd/keymaps/i386/qwerty/jp106_capsctrl.map.gz
}

# vim:set ts=2 sw=2 et:
md5sums=('5c5e772ec0211bb7e3683e2c02167563')
