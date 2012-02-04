# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-xpt
pkgver=0.4.8.1313
_scriptid=17190
pkgrel=1
pkgdesc="XP's Snippet Template engine for vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2611"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

build() {
    rm ${pkgname}.tar.gz
    mkdir -p ${pkgdir}/usr/share/vim/vimfiles
    mv ${srcdir}/* ${pkgdir}/usr/share/vim/vimfiles
}

md5sums=('d5d672d1ba9c74b2293e73c5884f05f7')
