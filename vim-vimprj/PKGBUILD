pkgname=vim-vimprj
pkgver=1.06
pkgrel=1
_scriptid=17219
pkgdesc='Plugin for managing options for different projects.'
url='http://www.vim.org/scripts/script.php?script_id=3221'
arch=('any')
license=('vim')

groups=('vim-plugins')
depends=('vim' 'vim-dfrankutil')

install=vimdoc.install

source=("vimprj-${pkgver}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('fc532fa3fb1af5948582cfae986ff712')

build() {
  install -dm755 $pkgdir/usr/share/vim/vimfiles/{doc,plugin,autoload}
  install -Dm644 $srcdir/vimprj/plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
  install -Dm644 $srcdir/vimprj/autoload/* $pkgdir/usr/share/vim/vimfiles/autoload/
  install -Dm644 $srcdir/vimprj/doc/vimprj.txt $pkgdir/usr/share/vim/vimfiles/doc/
}

