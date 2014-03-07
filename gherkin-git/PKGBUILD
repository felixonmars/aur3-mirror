# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=gherkin-git
pkgver=r89.2783542
pkgrel=1
pkgdesc="A functional programming language and interpreter written in GNU Bash 4"
arch=('any')
url="https://github.com/alandipert/gherkin"
license=('BSD')
depends=('bash')
makedepends=('git')
source=("$pkgname::git://github.com/alandipert/gherkin.git")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 gherkin $pkgdir/usr/bin/gherkin
  install -Dm644 core.gk $pkgdir/usr/share/gherkin/core.gk
  install -Dm444 LICENSE.txt $pkgdir/usr/share/licenses/gherkin-git/LICENSE
}

# vim:set ts=2 sw=2 et:
