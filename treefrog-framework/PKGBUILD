# Maintainer: Nils Sommer <mail@nilssommer.de>
pkgname=treefrog-framework
pkgver=1.7.7
pkgrel=1
epoch=
pkgdesc="High-speed and Full-stack C++ Framework for Web Applications"
arch=(i686 x86_64)
url="http://www.treefrogframework.org/"
license=('BSD')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=('postgresql-libs: postgresql driver for QtSql')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/treefrogframework/treefrog-framework/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('4609c3096fdd96f39be0cdad771894ac032548c82ab3801b73765115eb6d82ca')

prepare() {  
  cd "$srcdir/treefrog-framework-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/treefrog-framework-$pkgver/src"
  make
}

# for most packages DESTDIR is the variable to use, but the treefrog makefiles use INSTALL_ROOT
package() {
  cd "$srcdir/treefrog-framework-$pkgver/src"
  make INSTALL_ROOT="$pkgdir/" install
}
