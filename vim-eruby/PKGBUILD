# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-eruby
pkgver=2.0
_scriptid=1505
pkgrel=1
pkgdesc="Highlight eruby code blocks within html"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=403"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('33843de6fab620e476e76b88f4a8e511'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/eruby.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
