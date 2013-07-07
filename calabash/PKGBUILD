# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=calabash
pkgver=1.0.9
pkgrel=1
pkgdesc="An implementation of the XProc XML Pipeline Lanuage"
arch=('any')
url="http://xmlcalabash.com/"
license=('GPL' 'CDDL')
depends=('saxon-he')
optdepends=('java-commons-httpclient: p:http-request step'
            'jing: p:validate-with-relax-ng or cx:nvdl'
            'java-tagsoup: parse text/html in p:unescape-markup step')

source=(http://xmlcalabash.com/download/$pkgname-$pkgver-94.zip calabash.sh)
md5sums=('817f9f907eceac8f3343c9fd07ef1271'
         '660f82211f1373b60bf514d8d16f2d89')

package() {
  install -D -m644  $srcdir/$pkgname-$pkgver-94/$pkgname.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
