# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-selectbuf
pkgver=4.3
_scriptid=7232
pkgrel=2
pkgdesc="A fast and extensible buffer explorer"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=107"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('f9acac7b1211601fa4f5d56b7fb54b62'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,autoload}
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/doc/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/autoload/* ${pkgdir}/usr/share/vim/autoload/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

