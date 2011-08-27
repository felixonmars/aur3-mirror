# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-refactor
pkgver=1.03
_scriptid=8029
pkgrel=3
pkgdesc="C/C++ refactoring tool"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2087"
license=('custom')
groups=('vim-plugins')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('f3296fd79b8356bb09f2392d0d51f8e0')

build() {
    sed -i "s///g" ${pkgname}
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/refactor.vim
}
