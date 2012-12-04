# Contributor: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Wei Qiu <wei at qiu dot es>
pkgname=vim-closetag
pkgver=0.9.1
_scriptid=4318
pkgrel=3
pkgdesc="Functions and mappings to close open HTML/XML tags"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=13"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(closetag.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('360b61f1c83e4e890ef2d43e23f40b31'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm644 ${srcdir}/closetag.vim ${pkgdir}/usr/share/vim/vim73//plugin/closetag.vim || return 1
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

