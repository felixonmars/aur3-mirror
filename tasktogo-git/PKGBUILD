# Maintainer: Alexander Bauer <sasha@crofter.org>

pkgname=tasktogo-git
pkgver=v0.4.1.r3.g11143a7
pkgrel=1
pkgdesc="Command-line todo list manager for interactive and scripted use"
arch=('i686' 'x86_64')
url="https://github.com/SashaCrofter/tasktogo"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go>=1.2')
conflicts=('tasktogo')
provides=('tasktogo')
source=("$pkgname"::'git+https://github.com/SashaCrofter/tasktogo.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Create a Go directory inside the source directory, and link to the
  # actual package directory, so that the go tool is happy.
  mkdir -p "$srcdir/src"
  ln -f -s "../$pkgname" "$srcdir/src/$pkgname"
  cd "$srcdir/src/$pkgname"
  GOPATH="$srcdir" go get -fix -v -d
  make
}

check() {
  cd "$srcdir/src/$pkgname"
  GOPATH="$GOPATH:$srcdir" go test -v
}

package() {
  cd "$srcdir/src/$pkgname"
  make prefix="$pkgdir/usr" install
}

# vim: set ts=2 sw=2 et:
