pkgname=scangearmp-mx510series-x86_64
pkgver=1.90
pkgrel=1
pkgdesc="Canon Scanner Driver (MX510 Series) x86_64"
url="http://www.canon.fr/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/MX514MX515.aspx?type=download&page=1"
arch=('x86_64')
license=('custom')
depends=('sane')
conflicts=('scangearmp')
makedepends=('rpmextract')
source=(http://gdlp01.c-wss.com/gds/1/0100004131/01/scangearmp-mx510series-1.90-1-rpm.tar.gz)
md5sums=('d055b3dc640ebe1c6b60b77c78916b8e')

build() {
  cd $startdir/src/
  tar -xf $startdir/src/scangearmp-mx510series-$pkgver-$pkgrel-rpm.tar.gz
  cd $startdir/pkg/
  rpmextract.sh $startdir/src/scangearmp-mx510series-$pkgver-$pkgrel-rpm/packages/scangearmp-common-$pkgver-$pkgrel.x86_64.rpm
  rpmextract.sh $startdir/src/scangearmp-mx510series-$pkgver-$pkgrel-rpm/packages/scangearmp-mx510series-$pkgver-$pkgrel.x86_64.rpm
  mkdir -p usr/share/licenses/${pkgname}
  chmod -R a+rX usr/
}
