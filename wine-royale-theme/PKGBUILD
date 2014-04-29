# Maintainer: Levi Figueira <arch@levifig.com>

pkgname=wine-royale-theme
pkgver=1
pkgrel=0
pkgdesc="Microsoft's Royale theme for Windows Media Center/XP (to be used with Wine)"
arch=('i686' 'x86_64')
license=('custom')
depends=('wine')
url="http://en.wikipedia.org/wiki/Windows_XP_themes#Royale"
source=('http://projects.levifig.com/linux/aur/wine-royale-theme/Royale.msstyles')
md5sums=('cd5f85d821a4fb2758e57efe0668a7f6')
 
build() {
	mkdir -p $pkgdir/$HOME/.wine/drive_c/windows/Resources/Themes/Royale
	install -m0644 $srcdir/Royale.msstyles $pkgdir/$HOME/.wine/drive_c/windows/Resources/Themes/Royale/
}
