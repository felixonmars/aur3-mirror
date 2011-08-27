# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-tutticolori
pkgver=1.0
_scriptid=10785
pkgrel=1
pkgdesc="A port of the Tutti Colori theme from the Espresso editor"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2670"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('261b4dd42acadb863ac03f8736af0fe8'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/tutticolori.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
