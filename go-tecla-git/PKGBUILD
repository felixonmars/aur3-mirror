 
# Maintainer: Jens Staal <staal1978@gmail.com>

name=go-tecla
pkgname=$name-git
#wrapper for libtecla in go.
pkgver=20120417
pkgrel=1
pkgdesc="A Go wrapper for libtecla, command-line editing library"
arch=('i686' 'x86_64')
url="https://github.com/michaelmacinnis/tecla"
license=('MIT')
depends=('libtecla' 'go')
provides=('go-tecla')
makedepends=('git')
options=('!strip')
_gourl=github.com/michaelmacinnis/tecla


build() {
  cd "$srcdir"
  source /etc/profile.d/go.sh

  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  go get -fix "$_gourl"
}

package() {
  cd "$srcdir"
  source /etc/profile.d/go.sh

  # Package go package files
  for f in "$srcdir/build/go/pkg/"* "$srcdir/build/pkg/"*; do
    # If it's a directory
    if [ -d "$f" ]; then
      cd "$f"
      mkdir -p "$pkgdir/$GOROOT/pkg/`basename $f`"
      for z in *; do
        # Check if the directory name matches
        if [ "$z" == `echo $_gourl | cut -d/ -f1` ]; then
          cp -r $z "$pkgdir/$GOROOT/pkg/`basename $f`"
        fi
      done
      cd ..
    fi
  done

  # Package source files
  if [ -d "$srcdir/build/src" ]; then
    mkdir -p "$pkgdir/$GOROOT/src/pkg"
    cp -r "$srcdir/build/src/"* "$pkgdir/$GOROOT/src/pkg/"
    find "$pkgdir" -depth -type d -name .git -exec rm -r {} \;
  fi

  install -Dm644 "$srcdir/build/src/$_gourl/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}