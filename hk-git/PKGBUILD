# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=hk-git
pkgver=20140311.r5.ge083b5b
pkgrel=2
pkgdesc="Fast Heroku Client"
arch=('x86_64' 'i686')
url="https://github.com/heroku/hk"
license=('MIT')
makedepends=('go' 'mercurial' 'git')
depends=('glibc')
options=('!strip' '!emptydirs')
source=("git://github.com/heroku/hk.git")
md5sums=('SKIP')
provides=('hk')
conflicts=('hk')

pkgver() {
  cd "$srcdir/hk"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"
  rm -rf gopath
  mkdir -p gopath/src/github.com/heroku
  mv hk gopath/src/github.com/heroku/hk
}

build() {
  cd "${srcdir}/gopath/src/github.com/heroku/hk"
  export GOPATH="${srcdir}/gopath":$GOPATH
  go get github.com/kr/godep
  $srcdir/gopath/bin/godep go build
}

package() {
  cd "$srcdir/gopath/src/github.com/heroku/hk"

  install -Dm755 hk "${pkgdir}/usr/bin/hk"

  ./hk help about > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
