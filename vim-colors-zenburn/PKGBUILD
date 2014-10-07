# Maintainer: Koncz László <konlaasz at gmail dot com>

pkgname=vim-colors-zenburn
pkgver=2.25
pkgrel=2
pkgdesc="Nothing too fancy, just some alien fruit salad to keep you in the zone"
arch=('any')
url="http://slinky.imukuppi.org/zenburnpage/"
license=('GPL')
depends=('vim')
conflicts=('vim-colors-zenburn-git')
source=('https://github.com/jnurmine/Zenburn/archive/v2.25.tar.gz')
md5sums=('62141aa546f007f139c8303783a822e5')

package() {
  cd Zenburn-${pkgver}/colors
  install -Dm644 zenburn.vim $pkgdir/usr/share/vim/vimfiles/colors/zenburn.vim
}

# vim: ts=2 sw=2 et
