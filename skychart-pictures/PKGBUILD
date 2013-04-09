pkgname=skychart-pictures
pkgver=3.1
pkgrel=2
pkgdesc="9894 pictures for object of the SAC database for skychart / Cartes du Ciel"
arch=(any)
license=('GPL')
depends=('skychart')
url="http://www.ap-i.net/skychart/start"
options=('!strip')
source=(
"http://sourceforge.net/projects/skychart/files/2-catalogs/Nebulea/skychart-data-pictures-3.1-1466.noarch.rpm"
)
sha1sums=('2d41edf98484110928e07be165e2d4c1452ded8b')

package() {
cd "$srcdir"
chmod 644 "$srcdir/usr/share/skychart/data/pictures/sac/"*
mkdir -p "${pkgdir}"/usr/share/skychart/data/pictures
cp -r "$srcdir/usr/share/skychart/data/pictures/sac/"  "${pkgdir}/usr/share/skychart/data/pictures/sac/"
}
