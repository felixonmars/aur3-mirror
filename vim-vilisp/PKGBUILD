# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-vilisp
pkgver=2.3
_scriptid=4722
pkgrel=1
pkgdesc="Send Lisp code to a running Lisp interpreter"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=221"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tgz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('d8817088cedc507edf174f9d3133fc25'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/
    cp -aRf ${srcdir}/VIlisp-${pkgver}/* ${pkgdir}/usr/share/vim/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

