pkgname=vim-vcsnursery
pkgver=4
_scriptid=8570
pkgrel=1
pkgdesc='This package contains additional backends (Mercurial and sccs currently) for vim-vcscommand'
arch=('i686' 'x86_64')
url='http://www.vim.org/scripts/script.php?script_id=1898'
license=('MIT')
depends=('vim' 'vim-vcscommand')
optdepends=('mercurial')
source=("http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('66b4874099762db8aa664f1f7886f4e8')

build() {
  cd $startdir/src
  install -D -m644 plugin/vcshg.vim $startdir/pkg/usr/share/vim/plugin/vcshg.vim
  install -D -m644 plugin/vcssccs.vim $startdir/pkg/usr/share/vim/plugin/vcssccs.vim
  install -D -m644 syntax/HGAnnotate.vim $startdir/pkg/usr/share/vim/plugin/HGAnnotate.vim
  install -D -m644 syntax/SCCSAnnotate.vim $startdir/pkg/usr/share/vim/plugin/SCCSAnnotate.vim
}
