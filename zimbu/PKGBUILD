# Maintainer: TDY <tdy@gmx.com>

pkgname=zimbu
pkgver=2012.12.18
_rev=06f32a8d344c3c9fe1730ed993fc2ae9319b009f
pkgrel=1
pkgdesc="A new programming language that aims to be fast, concise, portable, and readable (from the creator of Vim)"
arch=('i686' 'x86_64')
url="'http://www.zimbu.org/"
license=('Apache')
makedepends=('clang')
install=vimdoc.install
source=($pkgname-$pkgver.zip::http://$pkgname.googlecode.com/archive/$_rev.zip)
md5sums=('dc09905606dd96acbb9ba6a7aec405ba')

build() {
  cd "$srcdir/$pkgname-${_rev:0:12}"
  make zuiclean bootstrap
  make
}

check() {
  cd "$srcdir/$pkgname-${_rev:0:12}"
  make test
}

package() {
  cd "$srcdir/$pkgname-${_rev:0:12}"

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
