# Contributor: glaucous <glakke1 at gmail dot com>

pkgname=xcursor-lil-polar
pkgver=0.1.2
pkgrel=3
pkgdesc="Smaller version of Eric Matthews's Polar Cursor Theme"
arch=('x86_64' 'i686')
url="http://gnome-look.org/content/show.php/Lil%27+Polar?content=31480"
license=('GPLv2')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://gnome-look.org/CONTENT/content-files/31480-lil-polar.tar.gz')
noextract=()
md5sums=('bb1a39bdffa8c6040f9f8d307017a449')

build()
{
	_themeloc="${pkgdir}/usr/share/icons/lil-polar"
	mkdir -p "$_themeloc/cursors"
	cp -R "${srcdir}/lil-polar/cursors" "$_themeloc/"
	cp "${srcdir}/lil-polar/index.theme" "$_themeloc/"
}
