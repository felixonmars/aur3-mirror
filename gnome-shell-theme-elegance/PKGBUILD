# Author: satya164 <http://satya164.deviantart.com/>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Max Bruckner

pkgname=gnome-shell-theme-elegance
pkgver=20130105
pkgrel=2
pkgdesc="A clean and elegant HUD theme for Gnome Shell 3.6."
url="http://satya164.deviantart.com/art/Gnome-Shell-Elegance-263626995"
license=('GPL')
arch=('any')
depends=('gnome-shell' 'gnome-shell-extensions')
optdepends=( 'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://fc00.deviantart.net/fs70/f/2013/005/b/b/gnome_shell___elegance_by_satya164-d4cyfw3.zip")
sha256sums=('9541c134d6070af31bf34fc3580f9e6bc5912fa35d8e825bdc9a3264ca006726')

package() {
	mkdir -p "${pkgdir}/usr/share/themes"
	cp -r "${srcdir}/Elegance" "${pkgdir}/usr/share/themes/"
	find "${pkgdir}/" -type d -exec chmod 755 {} \;
	find "${pkgdir}/" -type f -exec chmod 644 {} \;
}
