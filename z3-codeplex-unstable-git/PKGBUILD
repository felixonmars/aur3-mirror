# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=z3-codeplex-unstable-git
pkgver=20140421
pkgrel=2
pkgdesc="Z3 is a high-performance theorem prover being developed at Microsoft Research (built from Codeplex sources, unstable branch, libraries only)"
arch=('i686' 'x86_64')
url="http://z3.codeplex.com/"
license=('custom')
makedepends=('python2' 'git')
provides=('z3' 'z3-lib')
conflicts=('z3' 'z3-lib')

_gitroot="https://git01.codeplex.com/z3"
_gitname="z3-unstable"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  msg "Switching to unstable..."
  cd "$srcdir/$_gitname"
  git checkout unstable

  msg "Starting make..."
  cd "$srcdir/$_gitname"

# ./configure --prefix="$pkgdir" --with-python=/usr/bin/python2
  python2 scripts/mk_make.py # --prefix="$pkgdir"

  cd "$srcdir/$_gitname/build"
  make
}

package() {
  mkdir -p "$pkgdir/usr/include/z3"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"

  cd "$srcdir/$_gitname/src/api"
  cp `find . -name "z3*.h"` "$pkgdir/usr/include/z3"
  cd "$srcdir/$_gitname/src/api/c++"
  cp `find . -name "z3*.h"` "$pkgdir/usr/include/z3"

  cd "$srcdir/$_gitname/build"
  cp `find . -name "libz3.*"` "$pkgdir/usr/lib"
  cp `find . -name "libz3.*"` "$pkgdir/usr/lib/python2.7/site-packages"
  cp `find . -name "z3*.pyc"` "$pkgdir/usr/lib/python2.7/site-packages"

  cd "$srcdir/$_gitname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
