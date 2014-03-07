# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=hr-git
pkgver=1.0.r15.gc3ece40
pkgrel=1
pkgdesc="Horizontal rules for your terminal"
arch=('any')
url="https://github.com/LuRsT/hr"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("$pkgname::git://github.com/LuRsT/hr.git"
        "LICENSE")
sha1sums=('SKIP'
          '142fb14a0e928682d1d7f4acf7016e94a09cce9c')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"
  install -Dm444 LICENSE $pkgdir/usr/share/licenses/hr-git/LICENSE
  cd "$pkgname"
  install -Dm755 hr $pkgdir/usr/bin/hr
  install -Dm444 hr.1 $pkgdir/usr/share/man/man1/hr.1
}

# vim:set ts=2 sw=2 et:
