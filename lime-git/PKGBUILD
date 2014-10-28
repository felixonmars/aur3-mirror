# Contributor: Valentin-Costel Haloiu <vially.ichb+aur@gmail.com>

pkgname=lime-git
pkgver=r772.eb83152
pkgrel=1
pkgdesc="An experimental Sublime Text clone"
arch=('i686' 'x86_64')
url="https://github.com/limetext/lime"
options=('!strip')
license=(BSD)
depends=('go' 'python' 'oniguruma' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-graphicaleffects')
makedepends=('git' 'mercurial' 'cmake')
conflicts=('go-qml-git')

_gourl=github.com/limetext/lime
_gitroot="https://github.com/limetext/lime.git"
_gitname="lime"

build() {
  export GOPATH="$srcdir"

  msg2 "Building termbox frontend"
  go get -x -v -u ${_gourl}/frontend/termbox
  cd $GOPATH/src/github.com/limetext/lime/frontend/termbox
  go build

  msg2 "Building QML frontend"
  go get -x -v ${_gourl}/frontend/qml
  cd $GOPATH/src/github.com/limetext/lime
  git submodule update --init
  cd $GOPATH/src/github.com/limetext/lime/frontend/qml
  go build

  msg2 "Building HTML frontend"
  go get -x -v ${_gourl}/frontend/html
  cd $GOPATH/src/github.com/limetext/lime/frontend/html
  go build
}

check() {
  export GOPATH="$srcdir:/usr/lib/go/site"
  go test -x -v ${_gourl}/backend/...
  go test -x -v ${_gourl}/frontend/...
}

package() {
  export GOPATH="/usr/lib/go/site"
  mkdir -p $srcdir/{pkg,src} "$pkgdir/$GOPATH" ${pkgdir}/usr/bin
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gitname/$f" ]; then
      install -Dm644 "$srcdir/src/$_gitname/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done

  cat<<EOF > ${pkgdir}/usr/bin/lime_html
#!/usr/bin/bash

cd $GOPATH/src/${_gourl}/frontend/html
./html
EOF

  cat<<EOF > ${pkgdir}/usr/bin/lime_termbox
#!/usr/bin/bash

cd $GOPATH/src/${_gourl}/frontend/termbox
./termbox
EOF

  cat<<EOF > ${pkgdir}/usr/bin/lime_qml
#!/usr/bin/bash

cd $GOPATH/src/${_gourl}/frontend/qml
./qml
EOF
  chmod a+x ${pkgdir}/usr/bin/*
}

pkgver() {
  cd "src/$_gourl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
