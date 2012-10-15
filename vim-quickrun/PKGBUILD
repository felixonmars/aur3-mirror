# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=vim-quickrun
pkgver=0.6.0
pkgrel=1
pkgdesc='Run a command and show its result quickly.'
arch=('any')
license=('unknown')
url='https://github.com/thinca/vim-quickrun'
source=('vim-quickrun.zip::http://www.vim.org/scripts/download_script.php?src_id=18181')
install=vimdoc.install

build() {
  rm ${srcdir}/vim-quickrun.zip
  mkdir -p ${pkgdir}/usr/share/vim/vimfiles
  mv ${srcdir}/* ${pkgdir}/usr/share/vim/vimfiles
}
md5sums=('680f9b19d0b852dd976f6766c038a12c')
