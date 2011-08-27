# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-uptime
pkgver=1.3
_scriptid=3051
pkgrel=2
pkgdesc="Display Vim uptimes"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=965"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.bz2::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('4cf9bdd228917cd34238085a0f7d6a2d'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin}
    install -Dm755 ${srcdir}/uptime-${pkgver}/doc/* ${pkgdir}/usr/share/vim/doc/ && \
    install -Dm755 ${srcdir}/uptime-${pkgver}/plugin/* ${pkgdir}/usr/share/vim/plugin/ && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

