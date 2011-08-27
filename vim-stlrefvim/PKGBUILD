# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-stlrefvim
pkgver=1.0
pkgrel=2
pkgdesc="A C++ Standard Template Library reference manual for vim."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2353"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=("stlrefvim.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=9160")
md5sums=('e6731c9c31e3dd60b804ca6f347456ca')

build() {
        install -Dm644 doc/stlrefvim.txt ${pkgdir}/usr/share/vim/vimfiles/doc/stlrefvim.txt
        install -Dm644 plugin/stlrefvim.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/cpp/stlrefvim.vim
}
