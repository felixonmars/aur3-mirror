pkgname="urxvt-yac"
pkgver=1
pkgrel=1
pkgdesc="yet another clipboard script for urxvt"
arch=("any")
depends=('rxvt-unicode' 'xsel')
license=("GPL")
url='http://wiki.archlinux.org/index.php/Rxvt-unicode'
source=("clipboard" )
md5sums=('4158228cbb55bec11b90e05c87012a15')
install="$pkgname.install"

build() {
  install -Dm644 ${srcdir}/clipboard ${pkgdir}/usr/lib/urxvt/perl/clipboard
}
md5sums=('08bc187c8ebacf164c99f44232bb309d')
