# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=cheerp-libcxxabi-headers-git
pkgver=20141020142405
pkgrel=1
pkgdesc="A cheerp enabled libc++ ABI implementation"
url="http://leaningtech.com/duetto/"
arch=('x86_64' 'i686')
license=()
depends=()
optdepends=()
makedepends=('cheerp-llvm-clang-git' 'cheerp-utils-git')
conflicts=()
replaces=()
backup=()
install=
source=("git://github.com/leaningtech/${pkgname%-headers-git}")
md5sums=(SKIP)

pkgver() {
  date +%Y%m%d%H%M%S
  #cd "${pkgname%-headers-git}"
  #git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  true
}

package() {
  cd "${srcdir}/${pkgname%-headers-git}"
  mkdir -p "${pkgdir}/opt/cheerp/include/"
  cp -R include "${pkgdir}/opt/cheerp/include/cheerp-libcxxabi"
}

# vim:set ts=2 sw=2 et:
