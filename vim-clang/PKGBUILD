# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=vim-clang
pkgver=1.0
pkgrel=1
pkgdesc="Clang compiler definition"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3259"
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=('clang.vim::http://www.vim.org/scripts/download_script.php?src_id=13950')

package() {
  install -Dm644 ${srcdir}/clang.vim ${pkgdir}/usr/share/vim/vimfiles/compiler/clang.vim
}

md5sums=('26b1029b5658eac0f828859e2cab5b31')
md5sums=('518e4949f1bd391168dc0b1b27dc02fc')
