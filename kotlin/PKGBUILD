# Maintainer: Vorzard

pkgname=kotlin
pkgver=0.11.91.1
pkgrel=1
pkgdesc="Statically typed programming language that compiles to JVM bytecode and JavaScript"
arch=('any')
url="http://kotlinlang.org/"
license=('Apache')
depends=('java-environment')
source=("https://github.com/JetBrains/$pkgname/releases/download/M11.1-bootstrap/$pkgname-plugin-$pkgver.zip"
	'kotlin.csh'
	'kotlin.sh')
sha512sums=('5b9b496e4f1d11f59964e3550dd4bf09feaf6e9d6288c4931bc3d0ab1c406f123706167ca427c90732fdf923ef7d92d22a2caf01f611130285536654fd612ee1'
            'c6adb1612323875ecce7529d9cc81b140fe16b6b98302c04235d226dacaa7846ea02f6428d19cec08549c62c4997ad387e6f0cec26ed4194379efa217c6a6243'
            'bb4812cd30db8790fc5608ae9622ee536aec160bd66b9b5aac2f791fe8ca0824a980757e67aa0dbacef4b076d2c9cfa64e624182d6348b9b1a83788101f31cc1')
package() {
  cd Kotlin
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/kotlin $pkgdir/usr/share/licenses/kotlin $pkgdir/etc/profile.d
  rm -r kotlinc/bin/*.bat
  cp -r -T kotlinc/license $pkgdir/usr/share/licenses/kotlin
  cp -r kotlinc/bin kotlinc/lib lib/ $pkgdir/usr/share/kotlin
  ln -s /usr/share/kotlin/bin/kotlinc $pkgdir/usr/bin/kotlinc
  ln -s /usr/share/kotlin/bin/kotlinc-jvm $pkgdir/usr/bin/kotlinc-jvm
  ln -s /usr/share/kotlin/bin/kotlinc-js $pkgdir/usr/bin/kotlinc-js
  install -m755 $srcdir/kotlin.{,c}sh $pkgdir/etc/profile.d
}