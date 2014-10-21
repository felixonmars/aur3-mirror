# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=cheerp-libcxxabi-git
pkgver=20141020144918
pkgrel=1
pkgdesc="A cheerp enabled libc++ ABI implementation"
url="http://leaningtech.com/duetto/"
arch=('x86_64' 'i686')
license=()
depends=()
optdepends=()
makedepends=('cheerp-llvm-clang-git' 'cheerp-utils-git' cheerp-libcxx-git)
conflicts=()
replaces=()
backup=()
install=
source=("git://github.com/leaningtech/${pkgname%-git}")
md5sums=(SKIP)

pkgver() {
  date +%Y%m%d%H%M%S
  #cd "${pkgname%-git}"
  #git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}/lib"
  export CXX="/opt/cheerp/bin/clang -target cheerp"
  ./buildit
}

package() {
  cd "${srcdir}/${pkgname%-git}/lib"
  mkdir -p "${pkgdir}/opt/cheerp/lib/"
  cp libcxxabi.bc "${pkgdir}/opt/cheerp/lib/"
  
  #cd "${srcdir}/${pkgname%-git}"
  #mkdir -p "${pkgdir}/opt/cheerp/include/"
  #cp -R include "${pkgdir}/opt/cheerp/include/cheerp-libcxxabi"
}

# vim:set ts=2 sw=2 et:
