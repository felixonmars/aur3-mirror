# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=vim-scrollcolors
pkgver=20060719
pkgrel=1
pkgdesc='This is colorscheme Scroller/Chooser/Browser. With this plugin, you walk through installed colorschemes using arrow keys.'
arch=('any')
license='unknown'
url='http://www.vim.org/scripts/script.php?script_id=1488'
depends=('vim')
source=('ScrollColor.vim::http://www.vim.org/scripts/download_script.php?src_id=5966')
md5sums=('511e6880171875819ae072053104b7d1')

# remove when aur supports no build() in PKGBUILDs
build() {
  true
}

package() {
  install -D -m644 ScrollColor.vim \
    ${pkgdir}/usr/share/vim/vimfiles/plugin/ScrollColor.vim
}
