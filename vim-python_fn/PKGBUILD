# Maintainer: Danny Navarro <j@dannynavarro.net>

pkgname=vim-python_fn
pkgver=1.13
_scriptid=9196
pkgrel=2
pkgdesc="A set of menus/shortcuts to work with Python files "
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=30"
license=('custom:vim')
depends=(vim)
groups=('vim-plugins')
source=("${pkgname}_${pkgver}.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        'license.txt')
md5sums=('6d170673d64892feb6fdda99fc083463'
         'cd49910a3dde6fe0a7e24ebe8cbf7066')

build() {
    cd ${srcdir}
    install -Dm644 ${pkgname}_${pkgver}.vim \
        ${pkgdir}/usr/share/vim/vimfiles/ftplugin/python/python_fn.vim || return 1
    install -Dm644 license.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
}
