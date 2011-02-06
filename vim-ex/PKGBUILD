# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=vim-ex
pkgver=8.02b
_scriptid=10903
pkgrel=1
pkgdesc="IDE all in vim."
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2627"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('2b1f643bcc58a02b582ffd68ab03d966'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/vim72/doc/ ${pkgdir}/usr/share/vim/vim72/plugin/
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/vim72/doc/
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/vim72/plugin/
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

