# Maintainer: Vladimir Chizhov <master@mirlord.com>

pkgname=vim-genutils
pkgver=2.5
_scriptid=11399
pkgrel=2
pkgdesc="General utility functions for Vim"
arch=(i686 x86_64)
license=('GPL3')
url="http://www.vim.org/scripts/script.php?script_id=197"
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=("http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('f0f60a1c9320a16a3637fdf7ea79e14f')

build() {
  cd $srcdir
  mv "download_script.php?src_id=$_scriptid" genutils.zip
  unzip -qqo genutils.zip -d genutils
}

package() {
  cd $srcdir/genutils

  mkdir -p $pkgdir/usr/share/vim/plugin/
  install -D -m644 "plugin/genutils.vim" "$pkgdir/usr/share/vim/plugin/"

  mkdir -p "$pkgdir/usr/share/vim/autoload/"
  install -D -m644 "autoload/genutils.vim" "$pkgdir/usr/share/vim/autoload/"
}

