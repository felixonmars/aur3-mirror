# Maintainer: Armin Fasold <aur @ bebna at de>
# Creator: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-darkburn
pkgver=1.3.1
_scriptid=10756
pkgrel=2
pkgdesc="Darkburn: A darker mod of Zenburn"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2648"
license=('GPL')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(darkburn.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('a91fae5d4b61e4ca5d6606a82b0d4f69')

build() {
    install -Dm755 ${srcdir}/darkburn.vim ${pkgdir}/usr/share/vim/vim73/colors/darkburn.vim || return 1
}

