# Maintainer: Todd Partridge <http://https://github.com/Gen2ly/archpkgs>

pkgname=vim-plugin-aftercolors
_pkgname=AfterColors
_pkgid=8679
pkgver=1.2
pkgrel=1
pkgdesc="Enable vim/after/colors directory to customize Vim colorschemes."
arch=("any")
url="http://www.vim.org/scripts/script.php?script_id=1641"
license=("custom")
depends=("vim")
install=
source=(${_pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_pkgid})
md5sums=('f40ee45d8a47a78cdfe3cb271f0fa376')

package() {
  install -Dm644 $srcdir/plugin/AfterColors.vim \
    $pkgdir/usr/share/vim/vimfiles/plugin/AfterColors.vim
}

# vim:set ts=2 sw=2 et: