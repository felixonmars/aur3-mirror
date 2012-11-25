# Maintainer: Manuel Mendez <mmendez534 at gmail dot com>
# Author: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-ifdef
pkgver=3.2
_scriptid=16097
pkgrel=1
pkgdesc="C Preprocessor Highlighting"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=7"
license=('custom')
depends=(vim)
install=vimdoc.install
source=(ifdef.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('00765bf25c8633df2c88b8dc4195b546')

build() {
    cd "$srcdir"
    install -Dm644 ifdef.vim "$pkgdir"/usr/share/vim/syntax/ifdef.vim
    sed -n '/^" Copyright/,/^\s*$/ p' ifdef.vim |
    	sed -e 's|^" ||' -e '/^\s*$/ d' > extracted-license.txt
    install -Dm644 extracted-license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
