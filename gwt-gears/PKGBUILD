# Contributor: Lee.MaRS <leemars@gmail.com>

pkgname=gwt-gears
pkgver=1.3.0
arch=(i686 x86_64)
pkgrel=1
pkgdesc="The Official Google Gears API Library for Google Web Toolkit."
url="http://gwt-google-apis.googlecode.com/"
license=('Apache 2')
depends=('java-environment' 'gwt>=2.0.3')
source=(http://gwt-google-apis.googlecode.com/files/$pkgname-$pkgver.zip)

build() {
  cd $startdir/src
  mkdir $startdir/pkg/opt/
  cp -R $pkgname-$pkgver $startdir/pkg/opt/$pkgname
}

md5sums=('6f4f05738ec18561acdd5e21a1bd58fe')
