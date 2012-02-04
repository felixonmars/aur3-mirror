# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-skittles_dark
pkgver=1.1
_scriptid=10531
pkgrel=2
pkgdesc="Dark, colorful scheme"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2595"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('cf63f037fd58ff0ba52d707b22e05704'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/skittles_dark.vim && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

