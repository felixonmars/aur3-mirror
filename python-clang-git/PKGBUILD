# Maintainer: Uroc327 <uroc327@cssbook.de>

pkgname=python-clang-git
pkgver=3.4.r49661.3d8ada6
_pkgbasever=3.4
pkgrel=3
pkgdesc="LLVM Clang Python3.3 bindings (clang.cindex module)"
arch=('any')
url="https://github.com/llvm-mirror/clang/tree/master/bindings/python"
#license=('custom:University of Illinois/NCSA Open Source License')
license=('custom')
depends=('clang=3.4')
source=("$pkgname"::'git+http://llvm.org/git/clang.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.r%s.%s" "${_pkgbasever}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  :
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd bindings/python/clang
  install -Dm644 __init__.py "${pkgdir}/usr/lib/python3.3/site-packages/clang/__init__.py"
  install -Dm644 cindex.py "${pkgdir}/usr/lib/python3.3/site-packages/clang/cindex.py"
  install -Dm644 enumerations.py "${pkgdir}/usr/lib/python3.3/site-packages/clang/enumerations.py"
}

