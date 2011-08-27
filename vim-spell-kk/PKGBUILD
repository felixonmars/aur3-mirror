# Maintainer: Baurzhan Muftakhidinov <baurthefirst at gmail dot com>
pkgname=vim-spell-kk
pkgver=20100906
pkgrel=1
pkgdesc="Kazakh dictionary for Vim spell checking"
arch=('any')
url="http://ftp.vim.org/vim/runtime/spell/"
license=('GPL')
depends=('vim')
source=('http://mail.kazgrid.kz/repo/kk.utf-8.spl')
md5sums=('ae2e6f74647b18ed38320e3c147274b3')

build() {
  cd "$startdir/src"

    install -Dm644 kk.utf-8.spl $startdir/pkg/usr/share/vim/vimfiles/spell/kk.utf-8.spl
}


