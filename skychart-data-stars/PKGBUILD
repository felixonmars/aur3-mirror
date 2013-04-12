pkgname=skychart-data-stars
pkgver=20130309
pkgrel=1
pkgdesc="All standard stars catalog down to magnitude 12 for skychart, including Sky2000, Tycho2, GCVS, WDS and search index for SAO, BD, HD, GC."
arch=(any)
license=('GPL')
depends=('skychart>=3.8')
conflicts=('skychart-catalog-vd' 'skychart-catalog-tycho2')
provides=('skychart-catalog-vd' 'skychart-catalog-tycho2')
replaces=('skychart-catalog-vd' 'skychart-catalog-tycho2')
url="http://www.ap-i.net/skychart/start"
options=('!strip')
source=(
"http://downloads.sourceforge.net/project/skychart/2-catalogs/Stars/skychart-data-stars-3.8-2293-linux_all.tar.bz2"
)
sha1sums=('07725595ae3a92715a40a51d7e74b249f1c3d552')

package() {
cd "$srcdir"
mkdir -p "${pkgdir}"/usr/share/skychart/
cp -a "$srcdir/share/skychart/cat"  "${pkgdir}/usr/share/skychart/cat"
}
