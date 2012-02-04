# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-wp
pkgver=0.1
_scriptid=10925
pkgrel=1
pkgdesc="folding support for MediaWiki-style syntax"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2694"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('73778fea840c818872532fbc1897e00e'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/wp.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
