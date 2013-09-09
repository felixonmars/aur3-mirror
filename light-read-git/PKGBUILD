# Maintainer: Lex Childs <lex.childs@gmail.com>

pkgname=light-read-git
pkgver=20130908
pkgrel=1
pkgdesc="A utility that will text to speech all selected text when Ctrl-z is pressed"
arch=('x86_64' 'i686')
url="https://github.com/lex148/LightRead"
license=('MIT')
depends=('xsel' 'xclip' 'alsa-utils')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
md5sums=('SKIP')
_gourl=github.com/lex148/LightRead

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
  install -Dm755 "${srcdir}/bin/LightRead" "${pkgdir}/usr/bin/LightRead"
}

