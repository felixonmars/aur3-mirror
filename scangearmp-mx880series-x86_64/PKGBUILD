# Contributor: L.Bryce Whitson Jr. <lwhitson2@gmail.com>

pkgname=scangearmp-mx880series-x86_64
pkgver=1.70
pkgrel=1
pkgdesc="Canon Scanner Driver (MX880 Series) x86_64"
url="http://www.canon.co.uk/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/PIXMA_MX884.aspx?type=download&page=1"
arch=('x86_64')
license=('custom')
depends=('sane')
conflicts=('scangearmp')
makedepends=('rpmextract')
source=(http://dl.dropbox.com/u/22771177/AUR/scangearmp-mx880series-1.70-1-rpm.tar.gz)
md5sums=('037f3c2786b966335d52fc296e8b7ca6')

build() {
  cd $startdir/src/
  tar -xf $startdir/src/scangearmp-mx880series-$pkgver-$pkgrel-rpm.tar.gz
  cd $startdir/pkg/
  rpmextract.sh $startdir/src/scangearmp-mx880series-$pkgver-$pkgrel-rpm/packages/scangearmp-common-$pkgver-$pkgrel.x86_64.rpm
  rpmextract.sh $startdir/src/scangearmp-mx880series-$pkgver-$pkgrel-rpm/packages/scangearmp-mx880series-$pkgver-$pkgrel.x86_64.rpm
  mkdir -p usr/share/licenses/${pkgname}
  chmod -R a+rX usr/
}
