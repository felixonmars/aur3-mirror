# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-visual_studio
pkgver=1.2
_scriptid=7729
pkgrel=1
pkgdesc="Vim and Microsoft Visual Studio .NET integration"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=864"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('83466a8084b41fa422d95db59938d661'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/visual_studio.py ${pkgdir}/usr/share/vim/plugin/visual_studio.py || return 1
    install -Dm755 ${srcdir}/visual_studio.vim ${pkgdir}/usr/share/vim/plugin/visual_studio.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

