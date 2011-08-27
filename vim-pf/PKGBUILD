# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-pf
pkgver=1.3
_scriptid=1762
pkgrel=1
pkgdesc="OpenBSD pf.conf (packet filter configuration)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=341"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('485021915b9b23d68b27566ff5861fdf'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/pf.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
