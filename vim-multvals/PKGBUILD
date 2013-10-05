# Maintainer: Vladimir Chizhov <master@mirlord.com>

pkgname=vim-multvals
pkgver=3.10
_scriptid=3582
pkgrel=1
pkgdesc="Array library for Vim"
license=('GPL3')
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=171"
depends=('vim' 'vim-genutils')
groups=('vim-plugins')
install=vimdoc.install
source=("http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('fc8eb06c6ab2376d5992bb485d4f938b')

build() {
  cd $srcdir
  mv "download_script.php?src_id=$_scriptid" multvals.vim
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/vim/plugin/
  install -D -m644 multvals.vim $pkgdir/usr/share/vim/plugin/
}

