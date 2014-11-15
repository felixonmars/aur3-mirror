# Maintainer: d.woffinden
pkgname=z3-git
pkgver=4.3.2.r0.gcee7dd3
pkgrel=1
pkgdesc="Z3 is a high-performance theorem prover being developed at Microsoft Research"
arch=('i686' 'x86_64')
url="https://z3.codeplex.com/"
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'python2')
optdepends=('python2: bindings for python2')
conflicts=('z3-bin' 'z3-codeplex')
provides=('z3')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=("$pkgname"::'git+https://git01.codeplex.com/z3')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit, cutting off 'v' prefix
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python2 scripts/mk_make.py

  cd "$srcdir/$pkgname/build"
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -D src/api/z3.h "$pkgdir/usr/include/z3.h"
  install -D src/api/z3_api.h "$pkgdir/usr/include/z3_api.h"
  install -D src/api/z3_v1.h "$pkgdir/usr/include/z3_v1.h"
  install -D src/api/z3_macros.h "$pkgdir/usr/include/z3_macros.h"
  install -D src/api/c++/z3++.h "$pkgdir/usr/include/z3++.h"
  install -D build/z3 "$pkgdir/usr/bin/z3"
  install -D build/libz3.so "$pkgdir/usr/lib/libz3.so"
  install -d "$pkgdir/usr/lib/python2.7/site-packages/"
  ln -s /usr/lib/libz3.so "$pkgdir/usr/lib/python2.7/site-packages/libz3.so"
  cp build/z3*.pyc "$pkgdir/usr/lib/python2.7/site-packages"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

