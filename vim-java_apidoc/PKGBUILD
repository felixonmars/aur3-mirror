# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-java_apidoc
pkgver=3.1.1
_scriptid=3152
pkgrel=1
pkgdesc="a great color scheme"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=358"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('2661b29a90612464ab5c2f96ce0b71d7'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/ftplugin/java_apidoc.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
