# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-browser
pkgver=1.1
_scriptid=4025
pkgrel=1
pkgdesc="web browser plugin"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1053"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('83cad92dc1b23fc6423a5922a9a8ce9f'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim
    cp -aRf ${srcdir}/browser-${pkgver}/* ${pkgdir}/usr/share/vim/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

