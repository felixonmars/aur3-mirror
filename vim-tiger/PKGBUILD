# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-tiger
pkgver=0.1
pkgrel=1
pkgdesc='vim plugins for tiger language'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=536'
license=('GPL')
depends=('vim')
groups=('vim-plugins')
source=(
"indent::http://www.vim.org/scripts/download_script.php?src_id=1648"
"syntax::http://www.vim.org/scripts/download_script.php?src_id=1649")

package() {
	cd "${srcdir}"
	install -Dm644 indent "${pkgdir}"/usr/share/vim/vimfiles/indent/tiger.vim
	install -Dm644 syntax "${pkgdir}"/usr/share/vim/vimfiles/syntax/tiger.vim
}
md5sums=('2b27c55d673589574c1bfd1b2de05e61'
         '65d2fb636875eca327a4e20885613683')
