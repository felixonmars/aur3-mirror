# Maintainer: JoJoS <jojos003@free.fr>
pkgname="llanfair"
pkgver="1.4.3"
pkgrel=1
epoch=
pkgdesc="A Java timesplitter"
arch=('any')
url="http://jenmaarai.com/llanfair/"
license=('CCPL')
depends=('java-environment' 'sh')
makedepends=('unzip')
noextract=("${pkgname}.${pkgver}_any.zip")
source=("http://share.jenmaarai.com/public/llanfair/${pkgname}.${pkgver}_any.zip" "llanfair")
noextract=()
md5sums=('779139f23089666199de9b06f2ecc100'
         'a86ba50de330dc108624c4a588b2d949')

package() {
  unzip -d "$srcdir/$pkgname-$pkgver" "${pkgname}.${pkgver}_any.zip"
	cd "$srcdir/$pkgname-$pkgver"

  install -d $pkgdir/opt/$pkgname/lib
  install -d $pkgdir/usr/bin

  install -m644 $srcdir/Llanfair.jar $pkgdir/opt/$pkgname/
  install -m644 $srcdir/README.TXT $pkgdir/opt/$pkgname/
  install -m644 $srcdir/lib/{JNativeHook,Sidekick}.jar $pkgdir/opt/$pkgname/lib/

  install -m755 $srcdir/llanfair $pkgdir/usr/bin/
}
