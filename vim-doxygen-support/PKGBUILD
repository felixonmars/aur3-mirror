# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-doxygen-support
pkgver=2.0.2
_scriptid=10318
pkgrel=2
pkgdesc="Generate Doxygen comments from user defined templates"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1955"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('d70e5c834e6915371eb45238eb3c8945'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/vim72/{doc,plugin}
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/vim72/doc/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/vim72/plugin/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

