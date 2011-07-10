# Maintainer: Zhang Li <RichSelian at gmail.com>
pkgname=vim-matrix
pkgver=1.10
pkgrel=1
pkgdesc="matrix screensaver for vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1189"
license=('Vim License')
depends=('vim')
groups=('vim-plugins')
source=(matrix.vim::http://www.vim.org/scripts/download_script.php?src_id=8687)
md5sums=('7f33c17ee605817bbcb83e10642c156f')
build() {
    install -Dm644 ${srcdir}/matrix.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/matrix.vim
}
