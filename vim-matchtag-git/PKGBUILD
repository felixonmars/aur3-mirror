# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=vim-matchtag-git
pkgver=22.6dfdab1
pkgrel=1
pkgdesc="Vim's MatchParen for HTML and XML tags"
arch=('any')
url='https://github.com/gregsexton/MatchTag'
license=('custom')
depends=('vim')
makedepends=('git')
source=('git+https://github.com/gregsexton/MatchTag.git'
        'html.vim.patch'
        'xml.vim.patch')
sha1sums=('SKIP'
          'a16b0785d4d616b845f8e829126c7ba0b1aafbe1'
          '3db24186603b94ff3493d5c410e3112a7c1cfccf')

pkgver() {
	cd "MatchTag"
	echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

prepare() {
	cd "MatchTag/ftplugin"

	# patch to remove "b:did_ftplugin" check
	# https://github.com/gregsexton/MatchTag/issues/14
	patch -p1 < "${srcdir}/html.vim.patch"

	# because html.vim gets renamed to html/matchtag.vim
	patch -p1 < "${srcdir}/xml.vim.patch"
}

package() {
	cd "MatchTag"

	# renamed files upon install to prevent having a matching file name for the stock ftplugin files
	# https://github.com/gregsexton/MatchTag/issues/14
	install -Dm644 'ftplugin/html.vim' "${pkgdir}/usr/share/vim/vimfiles/ftplugin/html/matchtag.vim"
	install -Dm644 'ftplugin/xml.vim' "${pkgdir}/usr/share/vim/vimfiles/ftplugin/xml/matchtag.vim"
}
