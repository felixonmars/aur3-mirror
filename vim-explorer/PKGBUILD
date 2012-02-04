# Contributor Jaejae <naive.monarch@gmail.com>
pkgname=vim-explorer
pkgver=0.98
_scriptid=7461
pkgrel=2
pkgdesc='A Vim plugin which enables Vim to act as a file manager'
arch=('i686' 'x86_64')
url='http://www.vim.org/scripts/script.php?script_id=1950'
license=('LGPL')
depends=('vim')
source=("http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('55a3712ac570ec9eac9040da5af92852')

build () {
	cd $startdir/src
	mv download_script.php?src_id=$_scriptid vimexplorer-$pkgver.vim

	install -D -m644 vimexplorer-$pkgver.vim $startdir/pkg/usr/share/vim/plugin/vimexplorer.vim
}
