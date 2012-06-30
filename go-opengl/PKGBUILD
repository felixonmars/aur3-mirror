# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sian Cao <sycao@redflag-linux.com>

pkgname=go-opengl
pkgver=20110822
pkgrel=1
pkgdesc="Go bindings for OpenGL"
arch=('x86_64' 'i686')
url="http://github.com/banthar/gl"
license=('custom')
depends=('go-sdl' 'glew')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl="github.com/banthar"

build() {
  cd "$srcdir"
  export GOPATH="$srcdir"
  go get -fix -v -x ${_gourl}/gl
  go get -fix -v -x ${_gourl}/glu
}

check() {
  source /etc/profile.d/go.sh
  export GOPATH="$GOPATH:$srcdir"
  go test -v -x ${_gourl}/gl
  go test -v -x ${_gourl}/glu
}

package() {
  source /etc/profile.d/go.sh
  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
