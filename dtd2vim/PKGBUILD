# Maintainer: Sergey Dovgal <arcadoss@gmail.com>

pkgname=dtd2vim
pkgver=20110907
pkgrel=2
pkgdesc="Script for creation XML data file for Vim7 XML omni-completion from DTDs"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=1462"
license=('GPL')
makedepends=('git')
depends=('perl-sgml-dtd')
provides=('dtd2vim')
source=()
md5sums=()

_gitroot='git://github.com/vim-scripts/dtd2vim.git'
_gitname='dtd2vim'

build() {
  cd "$srcdir"

  msg "Connecting to github.com GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
      cd "$_gitname" && git pull origin
      msg "The local files are updated."
  else
      git clone "$_gitroot"
  fi
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/bin"
  install -t "$pkgdir/usr/bin" ./dtd2vim
}

# vim:set ts=2 sw=2 et:
