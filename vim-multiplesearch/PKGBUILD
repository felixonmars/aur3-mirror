# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-multiplesearch
pkgver=1.3
_scriptid=9276
pkgrel=2
pkgdesc="Highlight multiple searches at the same time, each with a different color"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=479"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('9ffcb8cff9bade4205747347477e5e4d'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,autoload}
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/doc/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/autoload/* ${pkgdir}/usr/share/vim/autoload/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

