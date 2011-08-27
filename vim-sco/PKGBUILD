# Maintainer: Alex Weil <ajonat at gmail com>

pkgname=vim-sco
pkgver=4.02
_scriptid=7476
pkgrel=5
pkgdesc="Browse source code easily with cscope, ctags and marks system"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1638"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('5b7cc89f305afd32e93394786eb84bf2'
         'efbd5986e691ce8c876fb86e8f5961ea')

build()
{
	install -d ${pkgdir}/usr/share/vim/vimfiles/plugin || return 1
	install -Dm644 ${srcdir}/*.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
	install -Dm644 ${srcdir}/*.sco ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
	install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

