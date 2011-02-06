# Maintainer: Laszlo Papp <djszapi @ gmail at com>
# Contributor: Uwe <keksvernichter AT gmail DOT com>

pkgname=vim-spamassassin
pkgver=3.2
_scriptid=14189
pkgrel=1
pkgdesc="Syntax highlighting for SpamAssassin config files"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2617"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('7ed91401a6f3e5f5e1394a19e52db456'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/spamassassin.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
