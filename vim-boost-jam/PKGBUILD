# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=vim-boost-jam
pkgver=0.3
_scriptid=2552
_srcid=10632
pkgrel=2
pkgdesc="Jam (or Boost.Build) syntax"
url="http://www.vim.org/scripts/script.php?script_id=$_scriptid"
arch=('any')
license=('unknown')
install=vimdoc.install
groups=('vim-plugins')
source=(jam.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
md5sums=('9f0fe0074e21e32907c2b9d3a5b80910')
build() {
    install -Dm644 ${srcdir}/jam.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/jam.vim
}
