pkgname=skychart-data-dso
pkgver=20130309
pkgrel=1
pkgdesc="All the standard nebulae catalog for skychart, including 1.5 million galaxies PGC2009; NGC, PGC, GCM, GPN, LBN, OCL"
arch=(any)
license=('GPL')
depends=('skychart>=3.8')
url="http://www.ap-i.net/skychart/start"
source=(
"http://sourceforge.net/projects/skychart/files/2-catalogs/Nebulea/skychart-data-dso-3.8-2293-linux_all.tar.bz2"
)
sha1sums=('de9dd51d18f9f0a8e257f7f3c1470c900ab49fd6')

package() {
cd "$srcdir"
mkdir -p "${pkgdir}"/usr/share/skychart/
cp -a "$srcdir/share/skychart/cat"  "${pkgdir}/usr/share/skychart/cat"
}
