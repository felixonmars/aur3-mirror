# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-darkspectrum
pkgver=1.8
_scriptid=9771
pkgrel=2
pkgdesc="a gvim color scheme based on the oblivion color scheme for gedit"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2215"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('2e2014ee0e5ffe76214de188f23fca02'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/darkspectrum.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
