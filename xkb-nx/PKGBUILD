# Contributor: Dmytro Bagrii <dimich.dmb@gmail.com>

pkgname=xkb-nx
pkgver=1
pkgrel=1
pkgdesc="Keyboard layout customization for 3-level CapsLock switching"
arch=('i686' 'x86_64')
url="http://segfault.kiev.ua/~netch/my_3kb.txt"
license=('BSD')
groups=('xorg')
source=('nx_group' 'nx_types')
md5sums=('db9b07290374c24644629d7a64f0514f' 'd9edbb6afa3c74d88468592ac0442cbb')

package() {
  cd "${srcdir}"

  install -Dm644 nx_group "${pkgdir}/usr/share/X11/xkb/symbols/nx_group"
  install -Dm644 nx_types "${pkgdir}/usr/share/X11/xkb/types/nx_types"
}
