# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=cheerp-llvm-git
pkgver=c0a47d2
pkgrel=1
pkgdesc="LLVM infrastructure including cheerp support"
url="http://leaningtech.com/duetto/"
arch=('x86_64' 'i686')
license=()
depends=()
optdepends=()
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("git://github.com/leaningtech/${pkgname%-git}")
md5sums=(SKIP)

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "${srcdir}/${pkgname%-git}" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
