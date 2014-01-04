# Maintainer: Zac Kleinpeter <zac@kleinpeter.org>

pkgname=shoehorn-git
pkgver=20140103
pkgrel=1
pkgdesc="docker container manager"
arch=('x86_64' 'i686')
url="https://github.com/cajun/shoehorn"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
md5sums=('SKIP')
_gourl=github.com/cajun/shoehorn

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

check() {
  source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package() {
  source /etc/profile.d/go.sh
  mkdir -p "${pkgdir}/$GOPATH"
  cp -Rv --preserve=timestamps "${srcdir}"/{src,pkg} "${pkgdir}/$GOPATH"
  install -Dm755 "${srcdir}/bin/shoehorn" "${pkgdir}/usr/bin/shoehorn"
}

