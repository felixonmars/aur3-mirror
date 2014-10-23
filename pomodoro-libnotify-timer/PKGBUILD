# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=pomodoro-libnotify-timer
pkgver=r6.1f747eb
pkgrel=1
pkgdesc="Simple Pomodoro timer commands for your Bash shell with libnotify support"
arch=('any')
url="https://github.com/orschiro/scriptlets/tree/master/pomodoro-libnotify-timer"
license=('GPL2')
depends=('libnotify' 'libpulse')
makedepends=('git')
source=("$pkgname"::'git://github.com/orschiro/scriptlets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}