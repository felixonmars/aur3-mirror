# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-argtextobj
pkgver=1.1
_scriptid=10943
pkgrel=1
pkgdesc="Text-object like motion for arguments"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2699"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('5fcaf255e65aceabcdc9e2c8e20d6870'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/argtextobj.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
