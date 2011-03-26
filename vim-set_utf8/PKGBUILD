# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-set_utf8
pkgver=1.01
_scriptid=2391
pkgrel=1
pkgdesc="Switching to Unicode in an orderly manner"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=789"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('2e9055e42b3320aacbbb1ff761a0839a'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/scripts/set_utf8.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
