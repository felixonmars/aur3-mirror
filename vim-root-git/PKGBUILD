#Maintainer: olantwin <olantwin at gmail dot com>
pkgname=vim-root-git
pkgver=r18.7d5aa1f
pkgrel=1
pkgdesc="Basic syntax highlighting for the ROOT Data Analysis Framework"
arch=('any')
url="https://github.com/parnmatt/vim-root/tree/develop"
license=('MIT')
depends=(vim)
makedepends=('git')
conflicts=()
source=("$pkgname"::'git://github.com/parnmatt/vim-root.git#branch=develop')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 "$srcdir/$pkgname/syntax/root.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/root.vim"
}
