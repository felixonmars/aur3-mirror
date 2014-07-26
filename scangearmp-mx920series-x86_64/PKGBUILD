# MX920 Series update/maintainer: Miles "oddfox" Robinson <oddfox@gmail.com>
# Original scangearmp-mx880series-x86_64 Contributor: L.Bryce Whitson Jr. <lwhitson2@gmail.com>

pkgname=scangearmp-mx920series-x86_64
pkgver=2.10
pkgrel=1
pkgdesc="Canon Scanner Driver (MX920 Series) x86_64"
url="http://www.canon.co.uk/SupportProduct/Search/?ItemId=tcm:14-1030671"
arch=('x86_64')
license=('custom')
depends=('sane')
conflicts=('scangearmp')
makedepends=('rpmextract')
source=(http://gdlp01.c-wss.com/gds/2/0100005182/01/scangearmp-mx920series-2.10-1-rpm.tar.gz)
md5sums=('0419086e584d674fade11a9d8756493f')

build() {
  cd $startdir/src/
  tar -xf $startdir/scangearmp-mx920series-$pkgver-$pkgrel-rpm.tar.gz
  cd $startdir/pkg/
  rpmextract.sh $startdir/src/scangearmp-mx920series-$pkgver-$pkgrel-rpm/packages/scangearmp-common-$pkgver-$pkgrel.x86_64.rpm
  rpmextract.sh $startdir/src/scangearmp-mx920series-$pkgver-$pkgrel-rpm/packages/scangearmp-mx920series-$pkgver-$pkgrel.x86_64.rpm
  mkdir -p usr/share/licenses/${pkgname}
  chmod -R a+rX usr/
}