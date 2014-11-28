# Maintainer: Mildred Ki'Lya <mildred-pub.aur@mildred.fr>
pkgname=wclang-git
pkgver=0
pkgrel=1
pkgdesc="Clang wrapper for cross-compiling to Windows using Mingw"
url="https://github.com/tpoechtrager/wclang"
arch=('x86_64' 'i686')
license=(GPL)
depends=(mingw-w64-gcc)
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("wclang::git+https://github.com/tpoechtrager/wclang.git")
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
