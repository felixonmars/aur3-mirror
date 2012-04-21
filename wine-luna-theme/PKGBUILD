# Maintainer: Spike29 <leguen.yannick@gmail.com>

pkgname=wine-luna-theme
pkgver=1
pkgrel=1
pkgdesc="Windows XP Luna style to be used with Wine"
arch=('i686' 'x86_64')
license=('custom')
depends=('wine')
url="http://en.wikipedia.org/wiki/Windows_XP_themes#Luna"
source=('http://dl.dropbox.com/u/4199602/luna.msstyles')
md5sums=('e9a49ba149ab10e907636debd2cbf3c7')
 
build() {
	mkdir -p $pkgdir/$HOME/.wine/drive_c/windows/Resources/Themes/luna
	install -m0644 $srcdir/luna.msstyles $pkgdir/$HOME/.wine/drive_c/windows/Resources/Themes/luna/
}
