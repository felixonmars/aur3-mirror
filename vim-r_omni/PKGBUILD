# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-r_omni
pkgver=0.1
_scriptid=10676
pkgrel=1
pkgdesc="Auto completes R identifiers from the current file and the included libraries"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2656"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('084ba340a457a60df2b5547960ce9ce6'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/ftplugin/r_omni.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
