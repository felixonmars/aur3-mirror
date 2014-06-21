# Maintainer: Boris Staletic <boris [dot] staletic [at] gmail [dot] com>
# Contributor: bruenig
pkgname=diffpac-git
pkgver=20140613
pkgrel=3
pkgdesc="Stand alone replacemnet for pacdiffviewer"
arch=('i686' 'x86_64')
makedepends=('git')
_gitname=diffpac
license=('GPL-3')
url="https://github.com/bruenig/difpac.git"
depends=()
optdepends=('colordiff: colorized diff output')
provides=('diffpac')
conflicts=('diffpac')
source=('git+https://github.com/bruenig/diffpac.git')
sha512sums=('SKIP')
package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 "$srcdir/$_gitname/diffpac" "$pkgdir/usr/bin/"
}
