# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-colorzone
pkgver=0.2
_scriptid=11011
pkgrel=1
pkgdesc="Colorscheme Use More Soft Colors"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2681"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('85bec9df796eabb6b9bdae434979c808'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/colorzone.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
