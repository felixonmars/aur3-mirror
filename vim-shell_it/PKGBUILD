# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-shell_it
pkgver=1.0
_scriptid=10769
pkgrel=1
pkgdesc="easy shell"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2668"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('91cdc9501a50d9ce6daedcaeac527c92'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/shell_it.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
