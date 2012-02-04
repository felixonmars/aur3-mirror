pkgname=vim-dfrankutil
pkgver=1.0
pkgrel=1
_scriptid=17218
pkgdesc='Just a library for some scripts (Indexer, Vimprj).' 
url='http://www.vim.org/scripts/script.php?script_id=3221'
arch=('any')
license=('vim')

groups=('vim-plugins')
depends=('vim')

#install=vimdoc.install

source=("drank_util-${pkgver}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('6ec7d42ab3a5e22776087e7e0bb2e3cd')

build() {
  install -dm755 $pkgdir/usr/share/vim/vimfiles/autoload/dfrank
  install -Dm644 $srcdir/dfrank_util/autoload/dfrank/util.vim $pkgdir/usr/share/vim/vimfiles/autoload/dfrank
}

