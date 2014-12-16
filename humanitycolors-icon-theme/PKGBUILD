# Maintainer: Ivan Petruk <localizator at ukr dot net>

pkgname=humanitycolors-icon-theme
pkgver=14.04.3
pkgrel=1
pkgdesc="The Humanity Colors Icon Theme brings you the Humanity Icon Theme (Default Ubuntu Icon Theme) in all the colors of the rainbow and then some! Goes great with Ambiance and Radiance Colors GTK Theme (By US as well)."
arch=('any')
url="http://gnome-look.org/content/show.php/Humanity+Icons+Colors+Version?content=148933"
license=('GPL2')
groups=('gnome')
depends=('humanity-icon-theme' 'ubuntu-mono')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.dropboxusercontent.com/u/24598537/build/${pkgname}-${pkgver}.tar.gz")
sha256sums=('829fad957c68624678bc2feca6d79305eeaff83c90ce4516ba952e34210fde1f')

package() {
	install -dm 755 "$pkgdir"/usr/share/icons
	cd "${srcdir}"
	rm ${pkgname}-${pkgver}.tar.gz
	cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/icons
}