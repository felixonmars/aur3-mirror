# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Chahine <chahine dot moreau at gmail dot com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
#
#

pkgname=vim-cpp
pkgver=1.12
_scriptid=6320
pkgrel=4
pkgdesc="Extends C++ syntax highlighting to STL classes and method names"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1640"
license=('unknown')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(cpp.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('11ec7de6a4f34ea69fd5a63d000abd12')

package () {

    cd "$srcdir"

    install -d "$pkgdir/usr/share/vim/vimfiles/syntax"

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" cpp.vim

}
