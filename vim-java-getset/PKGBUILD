# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-java-getset
pkgver=1.10
_scriptid=1523
pkgrel=1
pkgdesc="Automatically add getter/setters for Java properties (including array-based)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=490"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('75803ba3be2cf47a7b7557779081c792'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/ftplugin/java_getset.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
