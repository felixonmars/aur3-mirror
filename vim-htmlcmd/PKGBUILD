# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-htmlcmd
pkgver=2.5
_scriptid=1165
pkgrel=1
pkgdesc="Rich HTML/XML commands"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=14"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('1bea36b45abfe8f03d7e6a6219c0ef89'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/htmlcmd.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
