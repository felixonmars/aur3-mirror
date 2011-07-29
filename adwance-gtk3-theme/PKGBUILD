pkgname=adwance-gtk3-theme
pkgver=1
pkgrel=1
pkgdesc='Adwance GTK3 Theme'
arch=('any')
license=('CCPL')
url='http://thedeviantmars.deviantart.com/art/Adwance-gtk3-207704533'
depends=('gtk3')
optdepends=('gnome-tweak-tool: provides easy access to themes and icons')
source=('http://fc09.deviantart.net/fs71/f/2011/126/5/c/adwance_gtk3_by_thedeviantmars-d3fntud.zip')
install=("$pkgname.install")
sha256sums=('93770a3454abb518fc32607c2e29e9e938d934df725e3a6ccb8d89fbaa2cd7e9')

package() {
	mkdir -p "${pkgdir}/usr/share/themes"
	cp -r "${srcdir}/Adwance" "${pkgdir}/usr/share/themes/"
}
