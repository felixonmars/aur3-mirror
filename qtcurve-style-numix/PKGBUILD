# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>

pkgname=qtcurve-style-numix
pkgver=1
pkgrel=2
pkgdesc="A flat and light theme with a modern look"
arch=('any')
url="http://half-left.deviantart.com/art/KDE4-QtCurve-Numix-378256536"
license=('GPL3')
depends=('qtcurve-kde4')
optdepends=('numix-themes: Gtk theme')
source=('http://fc01.deviantart.net/fs70/f/2013/166/5/7/kde4___qtcurve___numix_by_half_left-d697cm0.zip')
md5sums=('ceef3c31e9ae593df518a9fea3cf93f3')

package() {
	install -Dm644 Numix.qtcurve "$pkgdir/usr/share/apps/QtCurve/Numix.qtcurve"
	install -Dm644 Numix.colors "$pkgdir/usr/share/apps/color-schemes/Numix.colors"
}
