# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=vol-git
pkgver=r2.2798a84
pkgrel=1
pkgdesc="Volument control and notification (PulseAudio, pamixer and volnoti)"
arch=('i686' 'x86_64')
url="https://github.com/pschmitt/vol.sh"
license=('GPL')
depends=('pacman' 'pamixer' 'volnoti')
makedepends=('git')
source=("$pkgname"::'git://github.com/pschmitt/vol.sh.git')
#source=('git+https://github.com/pschmitt/vol.sh.git'
#source=('git+https://github.com/pschmitt/vol.sh.git#branch=master'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/vol.sh" "$pkgdir/usr/bin/vol"
}
