# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=hk
pkgver=20140314
pkgrel=1
pkgdesc="Fast Heroku Client"
arch=('x86_64' 'i686')
url="https://github.com/heroku/hk"
license=('MIT')
makedepends=('go' 'mercurial')
depends=('glibc')
options=('!strip' '!emptydirs')
source=("https://github.com/heroku/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e91589f965ef0e4bec21d0733986d648')

prepare() {
  cd "$srcdir"
  rm -rf gopath
  mkdir -p gopath/src/github.com/heroku
  mv "$pkgname-$pkgver" gopath/src/github.com/heroku/$pkgname
}

build() {
  cd "${srcdir}/gopath/src/github.com/heroku/${pkgname}"
  export GOPATH="${srcdir}/gopath":$GOPATH
  go get github.com/kr/godep
  $srcdir/gopath/bin/godep go build
}

package() {
  cd "$srcdir/gopath/src/github.com/heroku/${pkgname}"

  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"

  ./$pkgname help about > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # bash completion
  install -Dm644 ./contrib/hk-bash-completion.sh "$pkgdir"/usr/share/bash-completion/completions/hk

  # zsh completion
  install -Dm644 ./contrib/hk-zsh-completion.sh "$pkgdir"/usr/share/zsh/site-functions/_hk
}
