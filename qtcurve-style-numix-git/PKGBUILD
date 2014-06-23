# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>

pkgname=qtcurve-style-numix-git
pkgver=r1.d049ecf
pkgrel=1
pkgdesc="A flat and light theme with a modern look"
arch=('any')
url="https://github.com/numixproject/numix-kde-theme"
license=('GPL3')
depends=('qtcurve-kde4')
optdepends=('numix-themes: Gtk theme')
conflicts=('qtcurve-style-numix')
provides=('qtcurve-style-numix')
source=('git://github.com/numixproject/numix-kde-theme')
md5sums=('SKIP')

pkgver() {
	cd numix-kde-theme
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	
}

package() {
	cd numix-kde-theme

	install -Dm644 Numix.qtcurve "$pkgdir/usr/share/apps/QtCurve/Numix.qtcurve"
	install -Dm644 Numix.colors "$pkgdir/usr/share/apps/color-schemes/Numix.colors"
}
