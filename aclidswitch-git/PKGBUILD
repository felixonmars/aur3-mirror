# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=aclidswitch-git
pkgver=r12.3cdc5fd
pkgrel=1
pkgdesc="Simple power management tool that runs actions depending on the laptop's AC state"
arch=('i686' 'x86_64')
url="https://github.com/orschiro/aclidswitch"
license=('GPL2')
depends=('pacman' 'xorg-xbacklight')
install=aclidswitch.install
backup=('etc/default/aclidswitch')
makedepends=('git')
source=("$pkgname"::'git://github.com/orschiro/aclidswitch.git')
#source=('git+https://github.com/orschiro/aclidswitch.git'
#source=('git+https://github.com/orschiro/aclidswitch.git#branch=master'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 "$srcdir/$pkgname/default/aclidswitch" "$pkgdir/etc/default/aclidswitch"
  install -Dm644 "$srcdir/$pkgname/98-aclidswitch.rules" "$pkgdir/usr/lib/udev/rules.d/98-aclidswitch.rules"
  install -Dm644 "$srcdir/$pkgname/99-low-battery-action.rules" "$pkgdir/usr/lib/udev/rules.d/99-low-battery-action.rules"
  install -Dm755 "$srcdir/$pkgname/aclidswitch" "$pkgdir/usr/bin/aclidswitch"
}
