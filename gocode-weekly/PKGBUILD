# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

_tagname=go.weekly.2012-03-13
pkgname=gocode-weekly
pkgver=20120313
pkgrel=4
pkgdesc="An autocompletion/refactoring daemon for the Go programming language"
arch=(i686 x86_64)
url="https://github.com/nsf/gocode"
license=('GPL')
depends=('go-weekly-hg')
makedepends=('git')
optdepends=('auto-complete: emacs autocompletion')

# Extra underscore to stop the automatic pkgver update
__gitroot="https://github.com/nsf/gocode.git"
__gitname="gocode"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $__gitname ]] ; then
    cd "$__gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$__gitroot" "$__gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/src"
  mkdir -p "$srcdir/src"
  git clone "$srcdir/$__gitname" "$srcdir/src/$__gitname"
  cd "$srcdir/src/$__gitname"
  git checkout $_tagname

  GOPATH=$srcdir go build
}

package() {
  cd "$srcdir"
  install -Dm755 bin/gocode "$pkgdir/usr/bin/gocode"
  cd src/$__gitname
  install -Dm644 vim/autoload/gocomplete.vim "$pkgdir/usr/share/vim/vimfiles/autoload/gocomplete.vim"
  install -Dm644 vim/ftplugin/go.vim "$pkgdir/usr/share/vim/vimfiles/ftplugin/go.vim"
  install -Dm644 emacs/go-autocomplete.el "$pkgdir/usr/share/emacs/site-lisp/go-autocomplete.el"
}
