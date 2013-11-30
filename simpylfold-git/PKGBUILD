# Maintainer: Alice Ellmer <alice.ellmer@gmail.com>


pkgname=simpylfold-git
pkgver=v1.1.r4.g31520d3
pkgrel=1
pkgdesc='better-than-indent python syntax folding for vim'
arch=('any')
url='https://github.com/tmhedberg/SimpylFold'
license=('BSD')
depends=('vim')
makedepends=('git')
install=vimdoc.install
source=('git+https://github.com/tmhedberg/SimpylFold.git')
md5sums=('SKIP')
_git_name='SimpylFold'


pkgver() {
  cd "$srcdir/$_git_name"
  git describe --long | sed -E 's/-/-r/;s/-/./g'
}


build() {
  cd "$srcdir/$_git_name"
}


package() {
  cd "$srcdir/$_git_name"
  vimdir="$pkgdir"/usr/share/vim/vimfiles/plugin
  install -d "$vimdir"
  cp ftplugin/python/SimpylFold.vim "$vimdir"
  license_dir="$pkgdir"/usr/share/licenses/$pkgname
  install -d "$license_dir"
  mv LICENSE "$license_dir"
}

