#Contributor: David Lacerte <solarbear@gmail.com>
pkgname="eclox"
pkgver="0.8.0"
pkgrel="1"
pkgdesc="doxygen plugin for Eclipse"
arch=('i686' 'x86_64')
url="http://eclox.eu"
license=('GPL')
depends=('eclipse' 'doxygen')
source=("http://download.gna.org/eclox/packages/eclox_$pkgver.zip")
md5sums=('1a294baff70622a3ba4bfcf07b057ef5')

build()
{
  mkdir -p "$pkgdir"/usr/share/eclipse
  unzip eclox_$pkgver.zip -d "$pkgdir"/usr/share/eclipse
  cp -a "$srcdir"/{features,plugins} "$pkgdir"/usr/share/eclipse
}
