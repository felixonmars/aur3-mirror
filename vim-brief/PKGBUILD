# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-brief
pkgver=1.0
_scriptid=767
pkgrel=1
pkgdesc="Brief editor key binding emulation in Vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=265"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('64a5bd3ac30cbdac35dfd32eaf35c92b'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/brief.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
