# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tuldok <tuldok89 at gmail dot com>
pkgname=lib32-glib
pkgver=1.2.10
pkgrel=2
pkgdesc="GLib1 Compatibility Libraries"
arch=("x86_64")
url="http://download.opensuse.org/repositories/games/openSUSE_13.1"
license=('LGPL')
groups=()
depends=("")
makedepends=('rpmextract')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("$pkgname.rpm::http://download.opensuse.org/repositories/games/openSUSE_13.1/x86_64/glib-32bit-1.2.10-743.1.x86_64.rpm")

md5sums=('30d3e58117750148b72a985ed816bfa9')

build() {
  echo "Nothing to do"
}

package() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir"/$pkgname.rpm
  cd usr
  mv lib lib32
}

