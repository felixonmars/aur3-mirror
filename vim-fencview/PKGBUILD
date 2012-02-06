# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-fencview
pkgver=4.8
_scriptid=17381
pkgrel=1
pkgdesc="Autodetect multiple encodings"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=1708"
license=('unknown')
groups=('vim-plugins')
source=(fencview.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
build() {
    install -Dm644 ${srcdir}/fencview.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/fencview.vim || return 1
}
md5sums=('358c4f138ac52b7bbd5c309fa34bd67f')
