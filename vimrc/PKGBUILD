# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vimrc
pkgver=1
_scriptid=10986
pkgrel=1
pkgdesc="Word Processing in Vim (_vimrc win32)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2710"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('926264b219dc2becde8fce118c837116'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/etc/vimrc || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
