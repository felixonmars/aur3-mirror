# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-editsrec
pkgver=00.01.00
_scriptid=10950
pkgrel=1
pkgdesc="Vim Global Plugin for Editing .srec Files"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2701"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('3049d35a875846804ab5e221b9dc12de'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
