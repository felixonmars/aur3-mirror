#Maintainer: olantwin <olantwin at gmail dot com>
pkgname=vim-root
pkgver=1.0.0
pkgrel=1
pkgdesc="Basic syntax highlighting for the ROOT Data Analysis Framework"
arch=('any')
url="https://github.com/parnmatt/vim-root/"
license=('MIT')
depends=(vim)
conflicts=('vim-root-git')
source=("v$pkgver".tar.gz::'https://github.com/parnmatt/vim-root/archive/v$pkgver.tar.gz')
md5sums=('e4347414c4f89aef5562a2e0b9629436')

package() {
  install -Dm 644 "$srcdir/$pkgname-$pkgver/syntax/root.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/root.vim"
}
