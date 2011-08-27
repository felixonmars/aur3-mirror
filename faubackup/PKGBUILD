# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Johannes Held <mail@hehejo.de>
pkgname=faubackup
pkgver=0.5.9
pkgrel=1
pkgdesc="This Program uses a filesystem on a hard drive for incremental and full backups. All Backups can easily be accessed by standard filesystem tools (ls, find, grep, cp, ...)"
arch=(any)
url="http://faubackup.sourceforge.net/"
license=('GPL')
groups=()
depends=(perl)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/faubackup/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('44d3723e3c2d7bc4a63f8ac91699c8c2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
