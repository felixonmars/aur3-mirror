# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
pkgname=easyrpg-testgame-git
pkgver=05e6ca3
pkgrel=1
pkgdesc="RPG Maker 2000/2003 test suite game project, for EasyRPG development."
arch=('any')
url="http://www.easy-rpg.org/"
license=('GPL')
depends=('easyrpg-player')
makedepends=('git')
provides=('easyrpg-testgame')
source=("$pkgname::git://github.com/EasyRPG/TestGame.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's@-@.@g'
}

package() {
  cd "$srcdir/$pkgname/TestGame-2000"
  _where="$pkgdir/usr/share/${pkgname%-*}"
  install -dm755 $_where
  cp -Rp * $_where
}
