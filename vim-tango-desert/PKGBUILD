# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-tango-desert
pkgver=1.1.
_scriptid=10807
pkgrel=2
pkgdesc="Dark Color scheme based on tango palette and desert"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2671"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('da59e06e4a93840dafc6f8293bc5e2bc'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/tango-desert.vim && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

