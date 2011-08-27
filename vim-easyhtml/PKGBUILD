# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-easyhtml
pkgver=0.5.1
_scriptid=705
pkgrel=1
pkgdesc="Allows to add attributs/values/CSSProperties to HTML tags/attributs very easily"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=153"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('d45bf76ad17b34b894e8da4aec109851'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/EasyHtml.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
