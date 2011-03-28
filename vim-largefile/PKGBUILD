# Previous maintainer: Laszlo Papp <djszapi @ gmail at com>
# Current maintainer: Danny Navarro <j@dannynavarro.net>

pkgname=vim-largefile
pkgver=4
_scriptid=9277
pkgrel=3
pkgdesc="A vim plugin to work with large files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1506"
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}_${pkgver}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        'license.txt')
md5sums=('e742dd95b8801b185b0a0a3020589f2d'
         'cd49910a3dde6fe0a7e24ebe8cbf7066')

build() {
    cd ${srcdir}
    install -d {doc,plugin}
    vim -c "UseVimball ." -c "q" ${pkgname}_${pkgver}.vba.gz
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin} || return 1
    install -m644 doc/*.txt ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1
    install -m644 plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
    install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
