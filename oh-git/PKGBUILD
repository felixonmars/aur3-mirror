 
# Maintainer: Jens Staal <staal1978@gmail.com>

name=oh
pkgname=$name-git
# Shell formerly known as "gosh"
pkgver=20120417
pkgrel=1
pkgdesc="A Plan9 rc-inspired UNIX shell written in Go"
arch=('i686' 'x86_64')
url="https://github.com/michaelmacinnis/oh"
license=('MIT')
depends=('go-tecla-git' 'libtecla' 'go' 'ncurses')
provides=('oh')
options=('!strip' '!emptydirs')
install=install.oh
makedepends=('git')

_gourl=github.com/michaelmacinnis/oh

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
  
  #fixing some weird end results, will make nicer later when I figure out the stuff above...
  rm -rf $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/build/bin/oh $pkgdir/usr/bin/oh

  install -Dm644 "$srcdir/build/src/$_gourl/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}