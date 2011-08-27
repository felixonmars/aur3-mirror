
# Maintainer: Sven Wick <sven.wick@gmx.de>
pkgname=vim-sub
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Syntax highlighting for subtitle files in MicroDVD (sub) format"
arch=('any')
url="http://www.linuxpages.org/sub.vim_en.php"
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
source=(sub.vim-$pkgver.tar.gz ftdetect.sub.vim subtitle.sub)
noextract=()
md5sums=('0b47ebce1a39bcdd7478463aec3a160e'
         '1e8c9b24d619f147da3d8d48e3d57f95'
         '46519f77aac999e554e0f796cadea981')

package() {
  install -d "$pkgdir/usr/share/vim/vimfiles/ftdetect"
  install -d "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -d "$pkgdir/usr/share/doc/$pkgname/examples"
  install "$srcdir/sub.vim-$pkgver/sub.vim" "$pkgdir/usr/share/vim/vimfiles/syntax"
  install "$srcdir/ftdetect.sub.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/sub.vim"
  install "$srcdir/subtitle.sub" "$pkgdir/usr/share/doc/$pkgname/examples/"

}

