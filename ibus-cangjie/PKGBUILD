# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=ibus-cangjie
pkgver=2.1
pkgrel=1
pkgdesc="This is an IBus engine for users of the Cangjie and Quick input methods."
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/ibus-cangjie/"
license=('GPL3')
depends=('ibus>=1.4' 'pycangjie>=1.0' 'python>=3.2' 'python-gobject')
conflicts=()
makedepends=('intltool' 'dconf')
replaces=('ibus-cangjie-git')
install='ibus-cangjie.install'
sha256sums=('00563b16fdbc8033e019b37e3ee17f62fb5dd05c68fd67b114909d7261cd433c')
source=("http://cangjians.github.io/downloads/ibus-cangjie/$pkgname-$pkgver.tar.xz")

check () {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
