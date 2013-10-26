# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <zaniah@users.sf.net>
pkgname=gemwest
pkgver=1.03
pkgrel=1
epoch=
pkgdesc="A Gem Stone weight estimator/calculator for mounted gemstones"
arch=('any')
url="http://gemwest.sourceforge.net/"
license=('GPL')
groups=()
depends=('gtk2' 'gnome-vfs')
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
source=(http://sourceforge.net/projects/gemwest/files/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('e644e4829d9015ba09a09155d30663ba') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
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
