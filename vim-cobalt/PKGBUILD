# Maintainer: Gorodinskiy Konstantin <gor.konstantin@gmail.com>
pkgname=vim-cobalt
pkgver=1.4
pkgrel=1
pkgdesc="This is a Vim version of one of TextMate's default colour schemes, Cobalt. Only designed for GVim."
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2828"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(cobalt.vim::http://www.vim.org/scripts/download_script.php?src_id=15086)
md5sums=('29095d686adc2ba73c0ac28342fd2e67')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/colors
    install ${srcdir}/cobalt.vim ${pkgdir}/usr/share/vim/vimfiles/colors/
}
