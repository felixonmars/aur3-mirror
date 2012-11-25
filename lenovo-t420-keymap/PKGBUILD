# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=lenovo-t420-keymap
pkgver=1.0.0
pkgrel=1
pkgdesc="Remap some keys on T420. Previous song -> Home, Next song -> End, Previous page -> PageUp, Next page -> PageDown"
arch=('any')
url="https://aur.archlinux.org/packages/lenovo-t420-keymap/"
license=('GPL')
depends=('udev')
source=('lenovo-thinkpad_t420' '81-lenovo-keymap.rules')
md5sums=('9de8dad6dee5136cbd408d3d995e94af' 'add7f85a8038c19e26fe53a26ed72181')
build() {
  install -D $srcdir/lenovo-thinkpad_t420 $pkgdir/lib/udev/keymaps/lenovo-thinkpad_t420
  install -D $srcdir/81-lenovo-keymap.rules $pkgdir/etc/udev/rules.d/81-lenovo-keymap.rules
}
