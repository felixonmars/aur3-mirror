# Maintainer: Michael Louis Thaler <michael.louis.thaler at gmail>
# Contributor:	Thomas Mudrunka <harvie@@email..cz>

pkgname=webpidgin-z
pkgver=2.0.z8
pkgrel=2
pkgdesc="Allows access to all Pidgin features over a simple http interface such as those used in mobile phones. Binary version..."
arch=('i686' 'x86_64')
_arch='32'
license=('GPL')
url='http://www.shaorang.com/webpidginz/'
depends=(pidgin)
source=($pkgname-$pkgver.zip::"http://www.shaorang.com/webpidginz/descargar.php")
md5sums=('c6dab609160d93b324edff42feae1909')

build() {
  [ "$CARCH" = "x86_64" ] && _arch='64'
  install -Dm 755 ${srcdir}/webpidginz-v.2.0.Z-8-2011-02-14/linux${_arch}/webpidginz.so ${pkgdir}/usr/lib/pidgin/webpidginz.so
}
