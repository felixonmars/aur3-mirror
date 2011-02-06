#contributor: kagan <juanynie@mi.madritel.es>

pkgname=picoxine
pkgver=0.0.7
pkgrel=2
pkgdesc="PicoXine is a (very small) XINE implementation for playing audio events."
url="http://kde-apps.org/content/show.php?content=39596"
license="GPL"
depends=('glibc' 'xine-lib')
source=(http://kde-apps.org/CONTENT/content-files/39596-picoxine-0.0.7.tar.bz2)
md5sums=('7d4d0c29fcdfe24b71339ab9f0250cf3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./build.sh
  mkdir -p $startdir/pkg/usr/bin
  cp -R $startdir/src/$pkgname-$pkgver/picoxine $startdir/pkg/usr/bin/
}
