# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-pylint
pkgver=0.5
_scriptid=10365
pkgrel=1
pkgdesc="Compiler plugin for python style checking tool"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=891"
license=('custom')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('25893f585c0d1112ff2250b9c317635b'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} \
	${pkgdir}/usr/share/vim/vimfiles/compiler/pylint.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
