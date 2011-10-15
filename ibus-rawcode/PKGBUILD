# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

Maintainer: ShionjiYuuko <eien.mihoshi@gmail.com>
pkgname=ibus-rawcode
pkgver=1.3.1.20100707
pkgrel=1
epoch=
pkgdesc="Raw unicode input method for ibus"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/ibus-rawcode/"
license=('GPL')
groups=()
depends=('ibus')
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
source=(https://fedorahosted.org/releases/i/b/ibus-rawcode/$pkgname-$pkgver.tar.gz
        engine.diff)
noextract=()
md5sums=('7c7a5444d4e39c1870533aaf3b46e72c'
         'a672897a3b2b301a1eda2cac702ab779') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch src/engine.c -i ../engine.diff -o src/engine.patched
  mv src/engine.patched src/engine.c
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
