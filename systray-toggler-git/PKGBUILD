# Contributor: Tin Benjamin Matuka <mail@tbmatuka.com>

pkgname=systray-toggler-git
pkgver=v1.0.r0.gf97d428
pkgrel=1
pkgdesc="Tiny C systray program that toggles/rotates through icons on click and runs a command on change"
arch=('i686' 'x86_64')
url="https://github.com/tbmatuka/systray-toggler/"
license=('MIT')
depends=('gtk2')
makedepends=('git' 'gcc' 'gdk-pixbuf2' 'gtk2')
source=('systray-toggler::git+https://github.com/tbmatuka/systray-toggler.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/systray-toggler"
  # Use the tag of the last commit
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/systray-toggler"
  gcc -o systray-toggler systray-toggler.c `pkg-config --cflags --libs gtk+-2.0`
}

package() {
  cd "$srcdir/systray-toggler"
  install -Dm755 systray-toggler "$pkgdir/usr/bin/systray-toggler"

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
