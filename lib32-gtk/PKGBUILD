# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tuldok <tuldok89 at gmail dot com>
pkgname=lib32-gtk
pkgver=1.2.10
pkgrel=2
pkgdesc="GTK1 Compatibility Libraries"
arch=("x86_64")
url="http://download.opensuse.org/repositories/games/openSUSE_13.1"
license=('LGPL')
groups=()
depends=("lib32-glib")
makedepends=('rpmextract')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("$pkgname.rpm::http://download.opensuse.org/repositories/games/openSUSE_13.1/x86_64/gtk-32bit-1.2.10-1092.1.x86_64.rpm")

md5sums=('8714335651111180477c6494474e4ca3')

build() {
  echo "Nothing to build"
}

package() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir"/$pkgname.rpm
  cd usr
  mv lib lib32
}

