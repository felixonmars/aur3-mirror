# Maintainer: Andres Erbsen <andres@krutt.org>

pkgname=gostatic-git
pkgver=1.11.r0.g097c210
pkgrel=1
pkgdesc="Fast, dependency-tracking static site generator"
url="https://github.com/piranha/gostatic/"
arch=('x86_64' 'i686')
license=('ISC')
makedepends=('go')
options=('!strip' '!emptydirs')
_goimportpath='github.com/piranha/gostatic'
source=("$pkgname"::"git+https://$_goimportpath.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  GOPATH="$srcdir/go"
  mkdir -p $(dirname "$GOPATH/src/$_goimportpath")
  rm -rf "$GOPATH/src/$_goimportpath" || :
  cp -r "$srcdir/$pkgname" "$GOPATH/src/$_goimportpath"
}

build() {
  test -x /etc/profile.d/go.sh && source /etc/profile.d/go.sh
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/$_goimportpath"
  go get -u ./...
  go install
}

package() {
  install -Dm755 "$srcdir/go/bin/gostatic" "$pkgdir/usr/bin/gostatic"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/gostatic/LICENSE"
}

# vim:set ts=2 sw=2 et:
