# $Id$
# Maintainer: Brennan Taylor <taylor.brennan at gmail>

pkgname='golang-hg'
pkgver='weekly'
pkgrel=1
pkgdesc='A compiler toolchain from Google for the Go programming language'
arch=('i686' 'x86_64')
url='http://golang.org/'
license=('custom')
depends=('perl' 'ed' 'bison' 'make' 'awk')
makedepends=('mercurial')
provides=('go')
conflicts=('go')
options=('!strip')
install=$pkgname.install
source=(go.sh)
md5sums=('bc2b023837973b4aeb6966a58564fa68')

build() {
  _hgroot="https://go.googlecode.com/hg/"
  _hgrepo="go"

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone -r weekly $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  export GOROOT="$srcdir/$_hgrepo-build"
  export GOROOT_FINAL="/opt/go/"
  export GOOS="linux"
  export GOBIN="$GOROOT/bin"
  export PATH="$GOBIN:$PATH"

  mkdir -p "$GOROOT/bin"
  cd "$GOROOT/src"
  hg update

  . ./make.bash
}

package() {

  install -Dm644 go-build/misc/bash/go $pkgdir/etc/bash_completion.d/go
  install -Dm644 go-build/misc/emacs/go-mode-load.el $pkgdir/usr/share/emacs/site-lisp/go-mode-load.el
  install -Dm644 go-build/misc/emacs/go-mode.el $pkgdir/usr/share/emacs/site-lisp/go-mode.el
  install -Dm644 go-build/misc/vim/syntax/go.vim $pkgdir/usr/share/vim/vimfiles/syntax/go.vim
  install -Dm644 go-build/misc/vim/ftdetect/gofiletype.vim $pkgdir/usr/share/vim/vimfiles/syntax/gofiletype.vim

  mkdir -p $pkgdir/{etc/profile.d,opt/go}
  for i in bin doc misc src lib include pkg ; do
    cp -r go-build/$i $pkgdir/opt/go/$i
  done

  install $srcdir/go.sh $pkgdir/etc/profile.d/

  # Point Python scripts to the python2 binary
  cd $pkgdir/opt/go/misc/dashboard
  sed -i 's/python$/\02/' googlecode_upload.py godashboard/app.yaml
}
