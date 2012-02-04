# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-vc
pkgver=1.0
_scriptid=2133
pkgrel=1
pkgdesc="A color scheme resembling the MS Visual C++ IDE"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=698"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('8f041b1cc253c4f4520e1fbd79657102'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/vc.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
