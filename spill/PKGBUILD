# Maintainer: Michał Kazior <kazikcz@gmail.com>
pkgname=spill
pkgver=0.8
pkgrel=1
epoch=
pkgdesc="spill is a program for creating set of symbolic links from one directory hierarchy"
arch=('i686' 'x86_64')
url="http://www.rpcurnow.force9.co.uk/spill/index.html"
license=('GPL')
groups=()
depends=()
makedepends=('gcc' 'patch' 'coreutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.rpcurnow.force9.co.uk/spill/$pkgname-$pkgver.tar.gz"
        "spill-0.8-makefile.diff")
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/spill-0.8-makefile.diff"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('b87465402413b6da4bdf2f6e4c23c008'
         'a5320f021d43202b089031867873ccc2')
