# Maintainer: olantwin <olantwin at gmail dot com>
pkgname=vim-clang-format-git
pkgver=r181.b2fcaed
pkgrel=1
pkgdesc="Vim plugin for clang-format, a formatter for C, C++ and Obj-C code"
arch=(any)
url="https://github.com/rhysd/vim-clang-format"
license=('MIT')
depends=('clang')
makedepends=()
install=vimdoc.install
source=("git+https://github.com/rhysd/vim-clang-format.git")
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/vim-clang-format
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/vim-clang-format"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p ${_installpath}/{plugin,doc,autoload}
  cp -R autoload/* ${_installpath}/autoload
  cp -R plugin/* ${_installpath}/plugin
  cp -R doc/* ${_installpath}/doc
}
