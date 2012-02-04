# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-foldutil
pkgver=3.0
_scriptid=6267
pkgrel=2
pkgdesc="Utility for creating folds (using specified match criteria)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=158"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('54d7ebb089169452c4f5dc52f2898fc0'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname}.vim ${pkgdir}/usr/share/vim/plugin/foldutil.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

