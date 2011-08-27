# Contributor: Nathan Owe <ndowens.aur @ gmail.com>
pkgname=vim-dpaste
pkgver=0.1
pkgrel=3
pkgdesc="Vim plugin to paste to dpaste.com"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2519"
license=('unknown')
depends=('vim')
source=('dpaste.vim')
md5sums=('34744c9f918b109cafb49aeab21b41ed') 

build() {
  cd ${srcdir}/

  install -d ${pkgdir}/usr/share/vim/vim72/plugin
  install dpaste.vim ${pkgdir}/usr/share/vim/vim72/plugin/dpaste.vim
}
