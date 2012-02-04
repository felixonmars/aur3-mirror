# Contributor: cmorlok <christianmorlok@web.de>

pkgname=netbeans-uml6
pkgver=6.9
rel=201006101454
pkgrel=2
pkgdesc="Netbeans UML plugin"
url="http://uml.netbeans.org"
arch=('any')
license=('CDDL')
depends=('netbeans>=6.9')
source=( http://updates.netbeans.org/netbeans/$pkgver/final/zip/moduleclusters/netbeans-$pkgver-$rel-ml-uml.zip )
md5sums=( '17cf81be9e2f5d2c38116b688cd74d49' )
build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/netbeans
  cp -r $srcdir/uml $pkgdir/usr/share/netbeans
}
