# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-justify
pkgver=1.0
_scriptid=9032
pkgrel=1
pkgdesc="Simple text justifier inspired by Kartik Murari's format.vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=177"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('70d45a92e89576757d0b6e8f72acc01d'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/MyJustify.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
