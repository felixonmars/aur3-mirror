# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=go-goop
pkgver=1.0
pkgrel=3
pkgdesc="Dynamic object oriented programming support for Go"
arch=('x86_64' 'i686')
url="https://github.com/losalamos/goop"
license=('custom:LANS')
makedepends=('go')
options=('!strip' '!emptydirs')
_gourl=github.com/losalamos/goop

build() {
  cd "$srcdir"

  source /etc/profile.d/go.sh

  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg
  mkdir pkg
  cd pkg

  ln -s "$GOROOT/pkg/obj"
  ln -s "$GOROOT/pkg/tool"

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

# vim:set ts=2 sw=2 et:
