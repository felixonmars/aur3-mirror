
# Maintainer: Sven Wick <sven.wick@gmx.de>
pkgname=vim-mpsub
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Syntax highlighting for subtitle files in Mplayer (mpsub) format"
arch=('any')
url="http://www.linuxpages.org/mpsub.vim_en.php"
license=('GPL2')
groups=('vim-subtitles')
depends=('vim')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(mpsub.vim-$pkgver.tar.gz ftdetect.mpsub.vim subtitle.mpsub)
noextract=()
md5sums=('4d8315a8e5560f42813b8d074d5ce9ca'
         '03d02694114c786bd00120a01b11f3e2'
         'd7ce2f576f7abbeed0f58890633463bc')

package() {
  install -d "$pkgdir/usr/share/vim/vimfiles/ftdetect"
  install -d "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -d "$pkgdir/usr/share/doc/$pkgname/examples"
  install "$srcdir/mpsub.vim-$pkgver/mpsub.vim" "$pkgdir/usr/share/vim/vimfiles/syntax"
  install "$srcdir/ftdetect.mpsub.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/mpsub.vim"
  install "$srcdir/subtitle.mpsub" "$pkgdir/usr/share/doc/$pkgname/examples/"

}

