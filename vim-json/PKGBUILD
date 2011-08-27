# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=vim-json
pkgver=0.4
_scriptid=1945
_srcid=10853
pkgrel=1
pkgdesc="A syntax highlighting file for JSON"
url="http://www.vim.org/scripts/script.php?script_id=$_scriptid"
arch=('any')
license=('unknown')
install=vimdoc.install
groups=('vim-plugins')
source=(json.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
md5sums=('5a6aff6403d479b55a6d5c47cf2695d7')
build() {
    install -Dm644 ${srcdir}/json.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/json.vim
}
