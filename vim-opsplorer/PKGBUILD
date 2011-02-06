# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-opsplorer
pkgver=1.2
_scriptid=10271
pkgrel=1
pkgdesc="tree file explorer"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=362"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('edcfa2800c4c5eb60836f23ebfc7b156'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/opsplorer.txt ${pkgdir}/usr/share/vim/doc/opsplorer.txt || return 1
    install -Dm755 ${srcdir}/opsplorer.vim ${pkgdir}/usr/share/vim/plugin/opsplorer.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

