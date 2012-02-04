# Contributor: János Illés <ijanos@gmail.com>
pkgname=vim-unimpaired
pkgver=20101116
pkgrel=1
pkgdesc="Pairs of handy bracket mappings. Latest git version"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1590"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
install=vimdoc.install
_gitroot='https://github.com/tpope/vim-unimpaired.git'
_gitname='vim-unimpaired'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  cd ${srcdir}/vim-unimpaired

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 doc/unimpaired.txt $installpath/doc/unimpaired.txt
  install -Dm644 plugin/unimpaired.vim $installpath/plugin/unimpaired.vim

}

# vim:set ts=2 sw=2 et:
