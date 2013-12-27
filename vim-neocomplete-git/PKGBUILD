# Maintainer: Philipp Millar <poxar[at]fastmail[dot]fm>
pkgname=vim-neocomplete-git
pkgver=20131224
pkgrel=1
pkgdesc="Improved auto-completion system for Vim"
arch=(any)
url="http://github.com/Shougo/neocomplete.vim"
license=('custom')
groups=('vim-plugins')
depends=('gvim')
makedepends=('git')
install=vimdoc.install
source=(git://github.com/Shougo/neocomplete.vim.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/neocomplete.vim
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd ${srcdir}/neocomplete.vim

  git submodule init
  git submodule update

  msg "Submodule checkout done or server timeout"
}

package() {
  msg "Starting packaging"
  cd "$srcdir/neocomplete.vim"

  install -d ${pkgdir}/usr/share/vim/vimfiles
  cp -R --preserve=mode * ${pkgdir}/usr/share/vim/vimfiles
}
