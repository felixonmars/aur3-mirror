# Maintainer: Andreas B Wagner <AndreasBWagner@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-plumbing
pkgver=1.2
_scriptid=10735
pkgrel=1
pkgdesc="Syntax highlighting for Plan 9 plumbing files"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2661"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('bc414a64a09c2794f4d2586922535317'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/after/syntax/plumbing.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
