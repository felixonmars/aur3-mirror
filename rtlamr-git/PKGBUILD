# Maintainer: ceri
# Contributor: ceri

pkgname=rtlamr-git
pkgver=r90.1e9feb7
pkgrel=1
pkgdesc="RTL-SDR receiver for smart meters operating in the 900MHz ISM band"
arch=('x86_64' 'i686')
url="https://bemasher.github.io/rtlamr/"
license=('AGPL')
depends=('fftw' 'rtl-sdr')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=('git+https://github.com/bemasher/rtlamr')
md5sums=('SKIP')
_gourl=github.com/bemasher/rtlamr
_gitpath='rtlamr'

pkgver() {
  cd "$srcdir/$_gitpath"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Had to do some hacky stuff to get pkgver() to work when using 'go get'
  mkdir -p "$srcdir/src/$_gourl"
  cd "$srcdir/$_gitpath"
  mv * "$srcdir/src/$_gourl"
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/rtlamr" "$pkgdir/usr/bin"

  # Package license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -p -m755 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}