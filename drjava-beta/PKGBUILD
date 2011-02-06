# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=drjava-beta
pkgver=20090505r4932
pkgrel=1
pkgdesc="A lightweight IDE for writing Java programs"
arch=('i686' 'x86_64')
url="http://www.drjava.org"
license=('BSD')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/drjava/$pkgname-20090505-r4932.jar 'drjava.sh' 'LICENSE')
md5sums=('3fb369973b4c51a9b7dec7e21a202522' \
'4dc427b6d28c3c6ed668e0968c944f94' \
'2108800ef4928c954af10f1c44bcddfd') 

build() {
  cd $srcdir/

  install -d $pkgdir/{usr/{bin,share/licenses/$pkgname},/opt/$pkgname}
  install -D $pkgname-20090505-r4932.jar $pkgdir/opt/$pkgname/
  install -m755 drjava.sh $pkgdir/usr/bin/drjava
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/ 
}
# vim:set ts=2 sw=2 et:
