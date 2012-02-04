# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=xkas
pkgver=14
pkgrel=1
pkgdesc="A multi-target cross assembler"
arch=(i686 x86_64)
url="http://byuu.org/programming/"
license=(custom)
depends=(gcc-libs)
makedepends=()
optdepends=()
source=("http://byuu.org/files/${pkgname}_v$pkgver.tar.bz2")
md5sums=('4bcb467a4955240b2cdd96021781a74b')

build() {
  cd "$srcdir/$pkgname"
  sed -i -e '/^clear\|^strip/d' cc.sh
  ./cc.sh
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/share/licenses/xkas"
  sed -n '2,5p' libxkas/libxkas.hpp > "$pkgdir/usr/share/licenses/xkas/LICENSE"
  install -Dm755 xkas "$pkgdir/usr/bin/xkas"
}

# vim:set ts=2 sw=2 et:
