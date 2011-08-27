# Maintainer: TDY <tdy@gmx.com>

pkgname=varsha
pkgver=0.75
pkgrel=1
pkgdesc="A drag-and-drop DVD authoring tool"
arch=('any')
url="http://varsha.sourceforge.net/"
license=('GPL')
depends=('cdrkit' 'dvdauthor' 'dvd+rw-tools' 'dvd-slideshow' 'java-runtime'
         'mjpegtools')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname.jar
        $pkgname.sh)
md5sums=('3801354bc268f301d2083c1cf785c7cd'
         '3d6490c1e7000a8a7f36c4bedad36fbd')

build() {
  cd "$srcdir"
  install -Dm755 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
