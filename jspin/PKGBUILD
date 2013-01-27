# Please report PKGBUILD bugs at
# https://github.com/ystein/archlinux-aur-packages

# Maintainer: Yannik Stein <yannik.stein [at] gmail.com>

pkgname=jspin
pkgver=5.0
pkgrel=4
pkgdesc="A java gui for spin by Moti Ben-Ari. Please report PKGBUILD bugs at \
https://github.com/ystein/archlinux-aur-packages."

arch=(any)
url="http://code.google.com/p/jspin/"
license=('GPL')
depends=('spin>=6.0' 'java-runtime')
source=("http://$pkgname.googlecode.com/files/$pkgname-5-0.zip" 'jspin.sh')
md5sums=('a4cd4e338a4172004a0c6b5d79cbffc5' '992a2c486f130b1c3f7488c9904e25ef')

package() {
  install -Dm 644 ${pkgname}.jar $pkgdir/usr/share/java/$pkgname/${pkgname}.jar
  install -Dm 755 ${pkgname}.sh $pkgdir/usr/bin/$pkgname
}
