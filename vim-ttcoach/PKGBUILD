# Maintainer:  William Giokas (KaiSforza) <1007380@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-ttcoach
pkgver=1.2
_scriptid=2733
pkgrel=2
pkgdesc="Utility to train touch typing skills"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=461"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('61a78240d058c6c521524c4f9c9bfe26'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -d      ${pkgdir}/usr/share/vim/{doc,plugin,macros}
    install -Dm755  ${srcdir}/doc/* ${pkgdir}/usr/share/vim/doc/
    install -Dm755  ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/
    cp      -r      ${srcdir}/macros ${pkgdir}/usr/share/vim/
    install -Dm755  ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
