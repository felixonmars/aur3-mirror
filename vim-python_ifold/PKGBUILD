# Contributor: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Danny Navarro <j@dannynavarro.net>

pkgname=vim-python_ifold
pkgver=2.9
_scriptid=8583
pkgrel=3
pkgdesc="Improved version of python_fold. Uses folding expression for python code"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2002"
license=('custom:vim')
depends=(vim)
makedepends=(unzip)
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}_${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
        "license.txt")
md5sums=('aa3a59e2fc9e7cfe8064233b4f243513'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    cd ${srcdir}
    unzip -qqo ${pkgname}_${pkgver}.zip
}

package() {
    cd ${srcdir}

    install -d ${pkgdir}/usr/share/vim/vimfiles/ftplugin
    install -Dm644 python_ifold.*.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/ || return 1
    install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

