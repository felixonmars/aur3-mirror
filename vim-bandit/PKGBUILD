# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-bandit
pkgver=r274
_scriptid=10977
pkgrel=1
pkgdesc="Colour Scheme"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2645"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e5689f5c89c3cb679b416ab94dc22893'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{syntax,colors}
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    install -Dm755 ${srcdir}/syntax/* ${pkgdir}/usr/share/vim/syntax/ || return 1
    install -Dm755 ${srcdir}/colors/* ${pkgdir}/usr/share/vim/colors/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

