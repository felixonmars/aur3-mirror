# Maintainer:  Leif Warner <abimelech@gmail.com>
pkgname=binfmt_java
pkgver=1.0
pkgrel=1
pkgdesc="Enable direct exection of Java .jar files using binfmt_misc."
arch=('any')
url="http://github.com/LeifW/binfmt_java/"
license=('MIT')
depends=('java-runtime-headless')
source=(http://github.com/LeifW/$pkgname/archive/$pkgver.tar.gz)
md5sums=('5ddeab394e1d01d41bc9eedf6a320e07')

package() {
  install -m755 -D $pkgname-$pkgver/jarwrapper $pkgdir/usr/bin/jarwrapper
  install -m644 -D $pkgname-$pkgver/jarwrapper.conf $pkgdir/usr/lib/binfmt.d/jarwrapper.conf
}
