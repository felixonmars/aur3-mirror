# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=naos-themes
pkgver=1.2
pkgrel=1
pkgdesc="Naos gtk2, gtk3, and metacity themes"
arch=('any')
url="http://half-left.deviantart.com/art/Naos-GTK3-258074770"
license=('GPL')
depends=('gtk-engine-murrine')
source=(http://www.deviantart.com/download/258074770/naos___gtk3_by_half_left-d49nfrm.zip)
md5sums=('e52ec2ac9a9874d7621881a529f86d1b')

package() {
	sed -i "s/url (/url(/g" naos/gtk-3.0/gtk-widgets.css
	find naos/ -not -name *~ -type f \
	      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}
