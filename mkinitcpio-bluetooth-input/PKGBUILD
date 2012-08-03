# Author: Aline Freitas <aline@alinefreitas.com.br>
pkgname=mkinitcpio-bluetooth-input
pkgver=1.1
pkgrel=1
pkgdesc="This is a initcpio hook for bluetooth input devices. This is very useful if you have a bluetooth keyboard and use 'encrypt' hook"
url="https://github.com/alinefr/mkinitcpio-bluetooth-input"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('mkinitcpio' 'bluez')
makedepends=()
conflicts=()
replaces=()
backup=()
install=mkinitcpio-bluetooth-input.install
source=(install_btinput hook_btinput system.conf bluetooth.conf group passwd)
md5sums=('406a282896e10720d130fdc198b3cf5f'
         '45b52e47f6acd7b176ff3ac31f40447b'
         '56580f0a65fac823533a1c2046156019'
         '2bedfd42091947f6336806cc6a190b66'
         '7fed1e1fb855e41a6d64d41f8521d69a'
         '6364768eaa4b516d0f90bc1c84f85433')

package() {
  install -Dm644 install_btinput "${pkgdir}/usr/lib/initcpio/install/btinput"
  install -Dm644 hook_btinput "${pkgdir}/usr/lib/initcpio/hooks/btinput"
  install -Dm644 system.conf "${pkgdir}/usr/lib/initcpio/dbus/system.conf"
  install -Dm644 bluetooth.conf "${pkgdir}/usr/lib/initcpio/dbus/bluetooth.conf"
  install -Dm644 group "${pkgdir}/usr/lib/initcpio/dbus/group"
  install -Dm644 passwd "${pkgdir}/usr/lib/initcpio/dbus/passwd"
}

# vim:set ts=2 sw=2 et:
