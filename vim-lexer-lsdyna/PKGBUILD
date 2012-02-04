# Maintainer: Tim Hartman <tbhartman at gmail>
pkgname=vim-lexer-lsdyna
pkgver=20051221
pkgrel=1
pkgdesc="vim syntax highlighting definitions for LS-DYNA keyword files"
arch=(any)
url="http://polymerfem.com/showthread.php?96-VIM-mode-for-editing-LS-DYNA-input-files"
license=("unknown")
depends=('vim')
source=("http://polymerfem.com/polymer_files/vim.zip")
install="${pkgname}.install"
md5sums=('dc5c5fa918e7854c190e8be0c507367b')

package() {
  cd "${pkgdir}"
  
  mkdir -p "./usr/share/vim/vimfiles"
  cd "./usr/share/vim/vimfiles"
  
  mkdir "./syntax"
  cp "${srcdir}/.vim/syntax/lsdyna.vim" "./syntax/"
  mkdir "./ftplugin"
  cp "${srcdir}/.vim/ftplugin/lsdyna.vim" "./ftplugin/"
}
