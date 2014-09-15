# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-candy-git
pkgver=20140526
pkgrel=1
pkgdesc="Cotton candy colors, dark background"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="https://github.com/Shougo/shougo-s-github"
license=('custom:vim')
source=(https://raw.githubusercontent.com/Shougo/shougo-s-github/master/vim/colors/candy.vim)
sha256sums=('SKIP')
provides=('vim-colors-candy' 'vim-candy')
conflicts=('vim-colors-candy' 'vim-candy')

package() {
  install -Dm 644 "$srcdir/candy.vim" "$pkgdir/usr/share/vim/vimfiles/colors/candy.vim"
}
