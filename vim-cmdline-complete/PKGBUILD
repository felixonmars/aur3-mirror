# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-cmdline-complete
pkgver=1.1.3
_scriptid=2222
_srcid=8969
pkgrel=3
pkgdesc="complete command-line (: / etc.) from the current file"
url="http://www.vim.org/scripts/script.php?script_id=$_scriptid"
arch=('any')
license=('unknown')
# install=vimdoc.install
groups=('vim-plugins')
source=(cmdline_complete.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
md5sums=('81cdaea478d011f9766943ce01879607')
build() {
    install -Dm644 ${srcdir}/cmdline_complete.vim \
	    ${pkgdir}/usr/share/vim/vimfiles/plugin/cmdline_complete.vim
}
