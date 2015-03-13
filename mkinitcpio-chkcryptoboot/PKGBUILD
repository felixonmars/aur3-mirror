# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-chkcryptoboot
pkgver=0.0.1
pkgrel=1
pkgdesc="This hook checks for a modified bootloader code, in an encrypted boot setup, and warns the user to not enter his root device password"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-chkcryptoboot"
license=('BSD')
install=$pkgname.install
backup=('etc/default/chkcryptoboot.conf')
source=('ChangeLog' "$pkgname.install" 'chkcryptoboot.conf' 'chkcryptoboot_hook' 'chkcryptoboot_install')
changelog='ChangeLog'
sha256sums=('c1e396ddb409f83b2a3eac19174c9401e1e3266c5a9027fdc94dcdf1f1e969ba'
            'b1c6efd790836f85ea05664bc671a423a96992bea8f64d527375d765873fa186'
            'ca1bb4928e5e566273d6c2ba54ddff93f073da6500cb8c0a1b2019e3ce2ce357'
            'bf5e92c41003cd341c188bbc9e5a8a5761d57003cec4e677ff4ac8975ab2d662'
            'ad541c53a0230049d3bfc14853eec8fa422de64b8f40e6efd0710d48249ada25')

package() {
  install -Dm644 "$srcdir/chkcryptoboot.conf"	   "$pkgdir/etc/default/chkcryptoboot.conf"
  install -Dm644 "$srcdir/chkcryptoboot_hook"      "$pkgdir/usr/lib/initcpio/hooks/chkcryptoboot"
  install -Dm644 "$srcdir/chkcryptoboot_install"   "$pkgdir/usr/lib/initcpio/install/chkcryptoboot"
}
