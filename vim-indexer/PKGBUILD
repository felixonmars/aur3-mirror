pkgname=vim-indexer
pkgver=4.12
pkgrel=1
_scriptid=17250
pkgdesc='Auto-generate tags for all files of project(s) and keep tags up-to-date. Autoloads *.vim files from project/.vimprj/ directory. Can work together with vim-project plugin.'
url='http://www.vim.org/scripts/script.php?script_id=3221'
arch=('any')
license=('vim')

groups=('vim-plugins')
depends=('vim' 'ctags-for-indexer' 'vim-vimprj' 'vim-dfrankutil')
optdepends=('vim-project: vim IDE')

install=vimdoc.install

source=("indexer-${pkgver}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('f772a92e1096a9476d907e0fd72c6e46')

build() {
  install -dm755 $pkgdir/usr/share/vim/vimfiles/{doc,plugin}
  install -Dm644 $srcdir/indexer/plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
  install -Dm644 $srcdir/indexer/doc/indexer.txt $pkgdir/usr/share/vim/vimfiles/doc/
}

