# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-greputils
pkgver=2.8
_scriptid=4434
pkgrel=2
pkgdesc="Interface with grep, find and id-utils (not just another grep wrapper)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1062"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('5386da36ffd4a23877c8ec4dd52e5c2b'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/greputils.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

