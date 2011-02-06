# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-ansiesc
pkgver=9
_scriptid=10244
pkgrel=1
pkgdesc="ansi escape sequences concealed, but highlighted as specified (conceal)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=302"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e6d8bfedb2639710680cdb39eac3ece4'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,autoload}
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/doc/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/autoload/* ${pkgdir}/usr/share/vim/autoload/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

