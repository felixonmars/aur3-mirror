pkgname=skychart-catalog-tycho2
pkgver=20100911
pkgrel=1
pkgdesc="Tycho2 catalog for skychart, aka Cartes du Ciel."
arch=(any)
license=('GPL')
depends=('skychart>=3.4')
options=('!strip')
url="http://www.ap-i.net/skychart/start"
source=(
"http://download.origo.ethz.ch/skychart/2075/catalog_tycho2.tgz" )
sha1sums=('216a8d2a62eb801c870dbe8c3a38647db491ec48')

build() {
cd "$srcdir"
mkdir -p "${pkgdir}"/usr/share/skychart/
cp -a "$srcdir/cat"  "${pkgdir}/usr/share/skychart/cat"
}
