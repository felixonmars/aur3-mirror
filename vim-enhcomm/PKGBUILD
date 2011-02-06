# Maintainer: David Pernot <dpernot@gmail.com>

pkgname=vim-enhcomm
pkgver='2.3'
_scriptid=8319
pkgrel=7
pkgdesc='EnhancedCommentify plugin to comment/un-comment lines in source code files.'
arch=('any')
url='http://kotka.de/projects/enhancedcommentify/index.html'
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=$pkgname.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('09a88e1cec3b26531b1917cbb36269e3')

build() {
  cd ${srcdir}/EnhancedCommentify-${pkgver}
  _vimfiles="${pkgdir}/usr/share/vim/vimfiles"

  install -D -m644 doc/EnhancedCommentify.txt "$_vimfiles/doc/EnhancedCommentify.txt"
  install -D -m644 plugin/EnhancedCommentify.vim "$_vimfiles/plugin/EnhancedCommentify.vim"
  install -D -m644 ftplugin/ocaml_enhcomm.vim "$_vimfiles/ftplugin/ocaml_enhcomm.vim"
  install -D -m644 ftplugin/php_enhcomm.vim "$_vimfiles/ftplugin/php_enhcomm.vim"
  install -D -m644 LICENSE.EnhancedCommentify "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}