# Maintainer: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Dmitry ixaphire_at-gmail-dot+com 
pkgname=vim-jad
pkgver=1.3
_scriptid=1329
pkgrel=2
pkgdesc="Automatically decompiles java class files and displays java code"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=446"
license=('custom')
depends=(vim jad)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('0b39f72f8f22c0ec63b3378ac54399a4'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/jad.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
