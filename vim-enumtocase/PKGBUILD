# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-enumtocase
pkgver=r282
_scriptid=11024
pkgrel=1
pkgdesc="Convert enumerated lists to case statements"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2707"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('5a3b3a26bbb5dc24ee8c6ec923c5fd1e'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/enumtocase.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
