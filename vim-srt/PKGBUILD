
# Maintainer: Sven Wick <sven.wick@gmx.de>
pkgname=vim-srt
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Syntax highlighting for subtitle files in Subrip (srt) format"
arch=('any')
url="http://www.linuxpages.org/srt.vim_en.php"
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
source=(srt.vim-$pkgver.tar.gz ftdetect.srt.vim subtitle.srt)
noextract=()
md5sums=('d114a42b2372c05b018cbdfec83167cd'
         'b635042b15daac0cd1ddc7944c3e9fba'
         '9aef728929150071292e872dddb87878')

package() {
  install -d "$pkgdir/usr/share/vim/vimfiles/ftdetect"
  install -d "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -d "$pkgdir/usr/share/doc/$pkgname/examples"
  install "$srcdir/srt.vim-$pkgver/srt.vim" "$pkgdir/usr/share/vim/vimfiles/syntax"
  install "$srcdir/ftdetect.srt.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/srt.vim"
  install "$srcdir/subtitle.srt" "$pkgdir/usr/share/doc/$pkgname/examples/"

}

