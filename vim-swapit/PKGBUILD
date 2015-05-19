# Contributer: N30N <archlinux@alunamation.com>

pkgname="vim-swapit"
pkgver=0.3.4
_srcid=22806
pkgrel=1
pkgdesc="Extensible keyword swapper (turn yes to no, True to False and more)"
url="http://www.vim.org/scripts/script.php?script_id=2294"
license=("MIT")
arch=("any")
depends=("vim")
optdepends=("vim-matchit: for xml/html tag complete option")
install="vimdoc.install"
source=("swapit.${pkgver}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_srcid}")
sha1sums=("f6f7a8fb367a533a1a3add455fe77edf58cbb569")

package() {
	cd "${srcdir}/swapit-master"
	_installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -Dm644 doc/swapit.txt "${_installpath}/doc/swapit.txt"
	install -Dm644 plugin/swapit.vim "${_installpath}/plugin/swapit.vim"
	install -Dm644 autoload/cssswapit.vim "${_installpath}/autoload/cssswapit.vim"

	install -d "${_installpath}/after/ftplugin/"
	msg "${_installpath}/after/ftplugin/"
	install -m644 after/ftplugin/* "${_installpath}/after/ftplugin/"
}

# vim: set noet ff=unix
