# Mantainer: defendor at riseup dot net

pkgname=numix-solarized-elegance-colors
pkgver=2014.02.22
pkgrel=1
pkgdesc="Remix of numix gtk theme with solarized color schemes (light and dark versions) and elegance-colors preset for Gnome shell"
arch=('any')
url="http://bitterologist.deviantart.com/art/Numix-Solarized-417575928"
license=('GPL3')
depends=('gnome-shell-themes-elegance-colors')
source=(http://fc00.deviantart.net/fs71/f/2014/053/7/3/numix_solarized_by_bitterologist-d6wm3nc.zip)
md5sums=('9fc77c1112bffc34e84fc77838cff406')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	cp -rv ${srcdir}/Solarized\ theme/Numix\ Solarized ${pkgdir}/usr/share/themes/
	cp -rv ${srcdir}/Solarized\ theme/Numix\ Solarized\ Light ${pkgdir}/usr/share/themes/
	mkdir -p ~/.config/elegance-colors/presets/
	cp -rv ${srcdir}/Solarized\ theme/Elegance\ Colors\ Presets/* ~/.config/elegance-colors/presets/
}