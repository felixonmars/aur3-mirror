# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-ctk
pkgver=0.6
_scriptid=15260
pkgrel=1
pkgdesc="Fast compile and run plugin for Vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2618"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
license.txt)

build() {
	vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
	install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

md5sums=('a4ed1f25bc5762de508d992bc5a69fee'
         'efbd5986e691ce8c876fb86e8f5961ea')
