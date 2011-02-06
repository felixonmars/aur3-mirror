# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-spring
pkgver=1.0
_scriptid=9257
pkgrel=2
pkgdesc="Make your VIM bright with colors, and avoid the eyestrain"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2303"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('d9040f3dda1785dbc1cd6faaff7295b1'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/spring.vim && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
