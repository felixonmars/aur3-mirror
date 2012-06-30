# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=go-sdl
pkgver=20101216
pkgrel=1
pkgdesc="Go bindings for SDL "
arch=('x86_64' 'i686')
url="http://github.com/banthar/Go-SDL"
license=('custom')
depends=('go' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl="github.com/banthar/Go-SDL"

build() {
  cd "$srcdir"
  export GOPATH="$srcdir"
  go get -fix -v -x ${_gourl}/sdl
  go get -fix -v -x ${_gourl}/ttf
  go get -fix -v -x ${_gourl}/gfx
  go get -fix -v -x ${_gourl}/mixer
}

check() {
  source /etc/profile.d/go.sh
  export GOPATH="$GOPATH:$srcdir"
  go test -v -x ${_gourl}/sdl
  go test -v -x ${_gourl}/ttf
  go test -v -x ${_gourl}/gfx
  go test -v -x ${_gourl}/mixer
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
