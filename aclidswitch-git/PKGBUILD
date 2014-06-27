# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=aclidswitch-git
pkgver=r6.3913e83
pkgrel=1
pkgdesc="Change systemd's lid switch action depending on the laptop's AC state"
arch=('i686' 'x86_64')
url="https://github.com/orschiro/aclidswitch"
license=('GPL2')
depends=('pacman')
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
  install -Dm644 "$srcdir/$pkgname/60-aclidswitch.rules" "$pkgdir/usr/lib/udev/rules.d/60-aclidswitch.rules"
  install -Dm755 "$srcdir/$pkgname/aclidswitch" "$pkgdir/usr/bin/aclidswitch"
}
