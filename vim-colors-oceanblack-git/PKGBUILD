# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-oceanblack-git
pkgver=20140526
pkgrel=1
pkgdesc="Variation of OceanDeep by Tom Regner"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="https://github.com/chrisv/vim-chrisv/commits/master/colors/oceanblack.vim"
license=('custom:vim')
source=(https://raw.githubusercontent.com/chrisv/vim-chrisv/master/colors/oceanblack.vim)
sha256sums=('SKIP')
provides=('vim-colors-oceanblack')
conflicts=('vim-colors-oceanblack')

package() {
  install -Dm 644 "$srcdir/oceanblack.vim" "$pkgdir/usr/share/vim/vimfiles/colors/oceanblack.vim"
}
