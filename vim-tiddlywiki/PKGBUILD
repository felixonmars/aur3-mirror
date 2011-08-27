# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-tiddlywiki
pkgver=1
_scriptid=10958
pkgrel=1
pkgdesc="TiddlyWiki syntax file"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2705"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e822bf5c83fe6082f2acb47b0a231dbc'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/tiddlywiki.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
