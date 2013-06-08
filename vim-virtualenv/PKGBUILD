# Maintainer: Josh Klar <j@iv597.com>

pkgname=vim-virtualenv
_src_id=18269
_zip_dir="jmcantrell-vim-virtualenv-0cc7614"
pkgver=0.2
pkgrel=1
pkgdesc='Work with python virtualenvs in vim'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3486'
license=('unknown')
depends=('vim')
makedepends=("unzip")
source=("virtualenv.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")
noextract=("virtualenv.zip")
sha1sums=('bc2765b298090431019bc99b7aef2b05cca6d993')

package() {
	cd "${srcdir}"
	unzip virtualenv.zip
	install -Dm644 $_zip_dir/autoload/virtualenv.vim "${pkgdir}"/usr/share/vim/vimfiles/autoload/virtualenv.vim
	install -Dm644 $_zip_dir/doc/virtualenv.txt "${pkgdir}"/usr/share/vim/vimfiles/doc/virtualenv.txt
	install -Dm644 $_zip_dir/plugin/virtualenv.vim "${pkgdir}"/usr/share/vim/vimfiles/plugin/virtualenv.vim
}
