# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=bibshelf
pkgver=1.6.0
pkgrel=1
pkgdesc="A book organizer for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://code.google.com/p/bibshelf"
license=('GPL')
groups=('GNOME')
depends=('libsigc++' 'libglademm' 'gtkmm' 'libxml++' 'curl')
makedepends=('patch')
optdepends=()
provides=('bibshelf')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://bibshelf.googlecode.com/files/$pkgname-$pkgver.tar.gz"
	"bibshelf-sigc_namespace-1.6.0.patch"
	"bibshelf-bibshelf.desktop.in.in-1.6.0.patch")
noextract=()
md5sums=('00b0843daedd8de6b304087d1e873d6e'
         '0f16d763ee6c1d02af2d4e5ed15c5975'
         '0459de6997802c0f4d0d2a16e6a6ed90')

build() {
  cd "$srcdir/$pkgname-$pkgver"

 # Apply patch's http://code.google.com/p/bibshelf/issues/detail?id=1&can=1
  patch -p1 < "$srcdir/bibshelf-sigc_namespace-1.6.0.patch"
  patch -p1 < "$srcdir/bibshelf-bibshelf.desktop.in.in-1.6.0.patch"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
