# Maintainer: Tianjiao Yin <ytj000+AUR@gmail.com>
pkgname=vim-rainbow
pkgver=2.51
pkgrel=1
pkgdesc="Help you read complex code by showing diff level of parentheses in diff color"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=4176"
license=('custom')
groups=('vim-plugins')
install=vimdoc.install
#source=("rainbow.vim::http://www.vim.org/scripts/download_script.php?src_id=18989")
source=('rainbow.vim') 
md5sums=('7af6c1424906be4767eb768e15ee0601')
build() {
    install -Dm644 ${srcdir}/rainbow.vim \
                   ${pkgdir}/usr/share/vim/vimfiles/plugin/rainbow.vim
}
