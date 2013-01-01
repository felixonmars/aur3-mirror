# Maintainer: TDY <tdy@gmx.com>

pkgname=zimbu-hg
pkgver=793
pkgrel=1
pkgdesc="A new programming language that aims to be fast, concise, portable, and readable (from the creator of Vim)"
arch=('i686' 'x86_64')
url="http://www.zimbu.org/"
license=('Apache')
makedepends=('clang' 'mercurial')
provides=('zimbu')
conflicts=('zimbu')
install=vimdoc.install

_hgroot=https://zimbu.googlecode.com/hg/
_hgrepo=zimbu

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  make bootstrap
  make
}

check() {
  cd "$srcdir/$_hgrepo-build"
  make test
}

package() {
  cd "$srcdir/$_hgrepo-build"

  # lib
  install -dm755 "$pkgdir/usr/lib/zimbu/lib/zwt/"
  install -m644 lib/zwt/*.zu "$pkgdir/usr/lib/zimbu/lib/zwt/"
  install -m644 lib/*.zu "$pkgdir/usr/lib/zimbu/lib/"

  # bin
  install -Dm755 zimbu_test "$pkgdir/usr/lib/zimbu/zimbu"
  install -Dm755 zimbu_test2c "$pkgdir/usr/lib/zimbu/zimbu2c"
  install -Dm755 pluginproto "$pkgdir/usr/lib/zimbu/pluginproto"
  install -Dm755 zimbush "$pkgdir/usr/bin/zimbush"
  ln -s /usr/lib/zimbu/zimbu "$pkgdir/usr/bin/zimbu"

  # vim
  install -Dm644 vim/syntax/zimbu.vim "$pkgdir/usr/share/vim/vimfiles/syntax/zimbu.vim"
  install -Dm644 vim/indent/zimbu.vim "$pkgdir/usr/share/vim/vimfiles/indent/zimbu.vim"
  install -Dm644 vim/ftplugin/zimbu.vim "$pkgdir/usr/share/vim/vimfiles/ftplugin/zimbu.vim"
  install -Dm644 vim/filetype.vim "$pkgdir/usr/share/vim/vimfiles/filetype.vim"
}

# vim:set ts=2 sw=2 et:
