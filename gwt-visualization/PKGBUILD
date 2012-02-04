# Contributor: Lee.MaRS <leemars@gmail.com>

pkgname=gwt-visualization
pkgver=1.1.0
arch=(i686 x86_64)
pkgrel=1
pkgdesc="The Official Google Visualization API Library for Google Web Toolkit."
url="http://gwt-google-apis.googlecode.com/"
license=('Apache 2')
depends=('java-environment' 'gwt>=2.0.3')
source=(http://gwt-google-apis.googlecode.com/files/$pkgname-$pkgver.zip)

build() {
  cd $startdir/src
  mkdir $startdir/pkg/opt/
  cp -R $pkgname-$pkgver $startdir/pkg/opt/$pkgname
}

md5sums=('23b4df02f8bd8713b6becdec0e59b7ad')
