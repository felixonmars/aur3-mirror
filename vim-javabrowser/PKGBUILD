# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-javabrowser
pkgver=2.03
_scriptid=6184
pkgrel=1
pkgdesc="Shows java file class, package in a tree as in IDEs. Java source browser"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=588"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('eaefdc5627e7dc14426687ce43cb866c'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/plugin/ ${pkgdir}/usr/share/pixmaps/
    install -Dm755 ${srcdir}/pixmaps/* ${pkgdir}/usr/share/pixmaps/
    install -Dm755 ${srcdir}/vimfiles/plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

