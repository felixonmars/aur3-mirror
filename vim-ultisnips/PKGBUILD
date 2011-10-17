# Maintainer: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Dmitry ixaphire_at-gmail-dot+com 
pkgname=vim-ultisnips
pkgver=1.5
_scriptid=16569
pkgrel=1
pkgdesc="The ultimate snippet solution for python enabled Vim"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2715"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('747d8d29b5533ad807f30958d8548c28'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
#    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,utils,UltiSnips}
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,UltiSnips}
    install -Dm644 ${srcdir}/UltiSnips-${pkgver}/doc/* ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1
    cp -aRf ${srcdir}/UltiSnips-${pkgver}/plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
#    install -Dm755 ${srcdir}/ultisnips/utils/* ${pkgdir}/usr/share/vim/vimfiles/utils/ || return 1
    install -Dm644 ${srcdir}/UltiSnips-${pkgver}/UltiSnips/* ${pkgdir}/usr/share/vim/vimfiles/UltiSnips/ || return 1
#   install -Dm755 ${srcdir}/ultisnips/test.py ${pkgdir}/usr/share/vim/vimfiles/test.py || return 1
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
