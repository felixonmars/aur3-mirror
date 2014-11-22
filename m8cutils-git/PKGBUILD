# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
_pkgname=m8cutils
pkgname=${_pkgname}-git
pkgver=30.c3551a9
pkgrel=1
epoch=
pkgdesc="an assembler, a programmer, and a simulator/debugger for the Cypress M8C core including the PSoC family"
arch=('i686' 'x86_64')
url="https://github.com/steve-m/m8cutils.git"
license=('GPL2')
groups=()
depends=('flex')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+https://github.com/steve-m/${_pkgname}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_PREFIX=$pkgdir/usr install
}
