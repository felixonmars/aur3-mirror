# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=vim-mathml
pkgver=1.1
pkgrel=2
pkgdesc="MathML syntax highlighting for VIM "
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1235"
license=('unknown')
depends=('vim')
source=('mathml.vim')
md5sums=('f75a1cc7a1d5aa5ac4a49aa7cd4b0f70') 

package () {

  cd "$srcdir"

  install -d "$pkgdir"/usr/share/vim/vimfiles/syntax

  install -m 644 -t "$pkgdir"/usr/share/vim/vimfiles/syntax mathml.vim

}

# vim:set ts=2 sw=2 et:
