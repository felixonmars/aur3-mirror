# Maintainer: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
# Maintainer: Thomas Laroche <tho.laroche@gmail.com>
pkgname=go-sqlite3
pkgver=240.4c5aec8
pkgrel=1
pkgdesc="sqlite3 driver for go that using database/sql"
arch=('i686' 'x86_64')
url="https://github.com/mattn/go-sqlite3"
license=('MIT')
depends=('sqlite3' 'go')
makedepends=('git')
options=('!strip' '!emptydirs' 'staticlibs')
_gourl=github.com/mattn/$pkgname
source=("$pkgname::git+https://${_gourl}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir"
  mkdir -p src/$(dirname ${_gourl})
  ln -fs "$srcdir/$pkgname" src/${_gourl}
  GOPATH="$srcdir" go get -d -v -x -fix ${_gourl}
  rm -f "$srcdir/$pkgname/$pkgname" #Fix for symlink created by go fix
}

build() {
  cd "$srcdir"
  GOPATH="$(pwd)" go install -v -x ${_gourl}
}

package() {
  cd "$srcdir"
  export GOPATH="/usr/lib/go"
  mkdir -p $pkgdir$GOPATH/{src,pkg}

  cp -rvL --preserve=timestamps "$srcdir"/{src,pkg} "$pkgdir/$GOPATH"
  rm -rf "$pkgdir/$GOPATH/src/$_gourl/.git"
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done

}

# vim:set ts=2 sw=2 et: