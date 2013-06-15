# Maintainer: Vojtech Aschenbrenner <v@asch.cz>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-mru
pkgver=3.5
_scriptid=20075
pkgrel=1
pkgdesc="Plugin to manage Most Recently Used (MRU) files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=521"
license=('custom')
groups=('vim-plugins')
source=("${pkgname}"::"http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}" "license")
md5sums=('d9d612a71696f6ccfa41c37d1d4fa906'
         'a7db591ff9cddeb366ed0a2aea3b0359')

package() {
	cd ${srcdir}
	install -m 644 -D "license" "${pkgdir}/usr/share/licenses/${pkgname}/license"
	install -m 644 -D "${pkgname}" "${pkgdir}/usr/share/vim/vimfiles/plugin/mru.vim"
}

# vim:set ts=2 sw=2 et:
