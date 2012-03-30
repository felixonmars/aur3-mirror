pkgname=skychart-catalog-vd
pkgver=20100911
pkgrel=1
pkgdesc="GCVS (variable) and WDS (double) catalog for skychart, aka Cartes du Ciel."
arch=(any)
license=('GPL')
depends=('skychart>=3.4')
url="http://www.ap-i.net/skychart/start"
options=('!strip')
source=(
"http://download.origo.ethz.ch/skychart/2075/catalog_gcvs.tgz"
"http://download.origo.ethz.ch/skychart/2075/catalog_wds.tgz" )
sha1sums=(
          '760848ba568c5c0c04add8bc7af2481d72d8ca0a'
          '05f0d76cdcad64634eeac0aa4f6d72ec353817e4')

build() {
cd "$srcdir"
mkdir -p "${pkgdir}"/usr/share/skychart/
cp -a "$srcdir/cat"  "${pkgdir}/usr/share/skychart/cat"
}
