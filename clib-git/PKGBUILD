# Maintainer: shura <shura1991@gmail.com>

_pkgname=clib
pkgname=$_pkgname-git
pkgver=1.1.4
pkgrel=2
epoch=
pkgdesc="C package manager-ish"
arch=('i686' 'x86_64')
url="https://github.com/clibs/clib"
license=('GPL')
groups=()
depends=('curl')
makedepends=('git' 'sed')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname"::'git+https://github.com/clibs/clib.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  sed -n -e 's/\s*#\s*define\s\+CLIB_VERSION\s\+"\(.\+\?\)"/\1/p' src/version.h
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make PREFIX="$pkgdir" install
}
