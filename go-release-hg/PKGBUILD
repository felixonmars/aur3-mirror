# Maintainer: Christian Himpel <chressie gmail>
# Contributor: Andres Perera <andres87p gmail>
# Contributor: Ashok Gautham <ScriptDevil gmail>
# Contributor: Matthew Bauer <mjbauer95 gmail>
# Contributor: Vesa Kaihlavirta <vegai iki fi>

pkgname=go-release-hg
pkgver=8038
pkgrel=1
pkgdesc='Google Go compiler and tools (hg release)'
arch=(i686 x86_64)
url=http://golang.org/
license=(custom)
depends=()
makedepends=(ed mercurial)
provides=(go)
conflicts=(go)
options=(!strip !makeflags)
install=go.install
source=(go.sh goinst)

_hgroot=https://go.googlecode.com/hg/
_hgrepo=go

build() {
  unset GOARCH GOBIN GOOS GOROOT
  cd $srcdir/$_hgrepo/src
  hg update release
  LC_ALL=C GOROOT_FINAL=/opt/go ./make.bash
}

package() {
  cd $srcdir/$_hgrepo

  # install all files
  mkdir -p $pkgdir/opt/go
  find * -type f ! -executable -print0 | xargs -0 -I {} install -Dm644 {} $pkgdir/opt/go/{}
  find * -type f -executable -print0 | xargs -0 -I {} install -Dm755 {} $pkgdir/opt/go/{}

  # adjust permissions
  chmod -R g+w $pkgdir/opt/go
  find $pkgdir/opt/go -type d -print0 | xargs -0 chmod g+s

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/go/LICENSE
  install -Dm644 misc/bash/go $pkgdir/etc/bash_completion.d/go
  install -Dm644 misc/emacs/go-mode-load.el $pkgdir/usr/share/emacs/site-lisp/go-mode-load.el
  install -Dm644 misc/emacs/go-mode.el $pkgdir/usr/share/emacs/site-lisp/go-mode.el
  install -Dm644 misc/vim/syntax/go.vim $pkgdir/usr/share/vim/vimfiles/syntax/go.vim
  install -Dm644 misc/vim/ftdetect/gofiletype.vim $pkgdir/usr/share/vim/vimfiles/ftdetect/go.vim
  install -Dm644 misc/vim/ftplugin/go/import.vim $pkgdir/usr/share/vim/vimfiles/ftplugin/go/import.vim

  install -Dm755 $srcdir/go.sh $pkgdir/etc/profile.d/go.sh
  install -Dm755 $srcdir/goinst $pkgdir/opt/go/bin/goinst
}
md5sums=('a71308b0959ddc712467db60c7ca1df5'
         '304436b6ab490f98f0028c5ed4b82bbf')
