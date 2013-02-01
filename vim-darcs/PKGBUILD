# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=vim-darcs
pkgver=0.2.1
_scriptid=6324
pkgrel=1
pkgdesc="basic Darcs support for vim"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=356"
license=('GPL')
depends=('vim-runtime')
groups=('vim-plugins')
install=vimdoc.install
source=(darcs.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

build() {
    mkdir -p $pkgdir/usr/share/vim/vimfiles/plugin
    mv $srcdir/darcs.vim $pkgdir/usr/share/vim/vimfiles/plugin
}

md5sums=('aeb9a4ab08ca83f08be285cbb20bb361')
