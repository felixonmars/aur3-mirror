# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-darkdevel
pkgver=1.1.2
_scriptid=10291
pkgrel=2
pkgdesc="Darkdevel Vim colorscheme."
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2573"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('d189df7babb22987979aefd559693c82'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{colors,doc,plugin}
    install -Dm755 ${srcdir}/.vim/doc/* ${pkgdir}/usr/share/vim/doc/ || return 1
    install -Dm755 ${srcdir}/.vim/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/.vim/colors/* ${pkgdir}/usr/share/vim/colors/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

