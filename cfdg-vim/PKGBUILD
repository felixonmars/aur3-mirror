# Maintainer: Yann Kaiser <epsy nospace 46 at free dot fr>
# Contributor: Anton Golov <kdesevis at gmail dot com>
pkgname=cfdg-vim
pkgver=0.3
pkgrel=1
pkgdesc="Vim syntax files for CFDG design grammars."
arch=(any)
url="http://www.florianbrucker.de/index.php?p=cfdgsyntaxfile"
license=('custom:vim')
groups=('')
depends=('cfdg' 'vim' 'imagemagick')
source=(http://www.florianbrucker.de/content/cfdgsyntaxfile/cfdg.vim http://epsy.net46.net/aur/cfdg-vim-$pkgver-$pkgrel.patch)
md5sums=('0aa34a7819c8f3b0cfd41be8ba2eb71e' 'a41f48b17c731e434f7c78ffbccda3a8')

build() {
  cd $srcdir

  patch cfdg.vim < cfdg-vim-$pkgver-$pkgrel.patch

  mkdir -p $pkgdir/usr/share/vim/ftplugin/ $pkgdir/usr/share/vim/ftdetect/
  cp -L cfdg.vim $pkgdir/usr/share/vim/ftplugin/cfdg.vim
  echo >$pkgdir/usr/share/vim/ftdetect/cfdg.vim "au BufRead,BufNewFile *.cfdg		set filetype=cfdg"
}
