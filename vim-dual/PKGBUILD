# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-dual
pkgver=1.1
_scriptid=10923
pkgrel=1
pkgdesc="The Dual colorscheme that you've longing for"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2688"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('5b85483d8625a848ad9fbdbcfddf95ef'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/dual.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
