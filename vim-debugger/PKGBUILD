# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=vim-debugger
pkgver=1.0.2
_scriptid=9793
pkgrel=4
pkgdesc='A script to provide a debugger interface to the DBGp protocol.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2508'
depends=('vim' 'python>=2.3')
source=("http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
license=('unknown')
md5sums=('3a3507920e11cb315824b4813672ca91')

build() {
  cd $srcdir

  install -D -m644 plugin/debugger.vim $pkgdir/usr/share/vim/vimfiles/plugin/debugger.vim
  install -D -m644 plugin/debugger.py $pkgdir/usr/share/vim/vimfiles/plugin/debugger.py
}
# vim:syntax=sh

