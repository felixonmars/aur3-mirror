# Maintainer: Alexey Manaev <alex dot manaev at gmail dot com>

pkgname=vim-srcexpl
pkgver=4.3
_scriptid=14003
pkgrel=1
pkgdesc="A Source code Explorer based on tags works like context window in Source Insight"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/download_script.php?src_id=14003"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('779a7ab97b4dc6747446fa4e4aebaf90'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/srcexpl.vim && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
