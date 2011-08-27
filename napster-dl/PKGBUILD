# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>

pkgname=napster-dl
pkgver=0.6
pkgrel=5
pkgdesc="A Java-based application for downloading songs from free.napster.com"
arch=('any')
url="http://www.jkcool.com/$pkgname/"
license=('GPL')
depends=('java-runtime')
source=(http://www.jkcool.com/$pkgname/$pkgname-$pkgver.zip \
	$pkgname.sh \
	$pkgname.desktop)
md5sums=('aa1e71999aa71f78d5fd3b111546f09e'
         'aebf5362e030263fdb93238e28b34952'
         'e713ce1ba0643373cda8259067fda65a')

build() {
  cd $pkgname/dist

  find -type f -exec chmod 644 {} \;
  mkdir -p "$pkgdir"/usr/share/$pkgname
  cp -rf $pkgname.jar lib/ "$pkgdir"/usr/share/$pkgname/

  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../src/napsterdl/res/napster_head.png \
	"$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir"/$pkgname.desktop \
	"$pkgdir"/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
