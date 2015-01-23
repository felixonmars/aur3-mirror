# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=conkytimer-git
_pkgname=conkytimer
pkgver=r17.9878e9c
pkgrel=1
pkgdesc="Simple countdown timer for conky"
arch=('any')
url="https://github.com/orschiro/scriptlets/tree/master/ConkyTimer"
license=('GPL3')
depends=('libnotify' 'libpulse')
makedepends=('git')
source=("$pkgname"::'git://github.com/orschiro/scriptlets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/ConkyTimer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/ConkyTimer/conkyTimer.sh" "$pkgdir/usr/bin/$_pkgname"
}
