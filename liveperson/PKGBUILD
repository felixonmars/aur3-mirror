#Maintainer: "slaveriq <arch@plassmann.biz>"
pkgname=liveperson
pkgver=9.3.0.3
license=('custom')
pkgrel=2
arch=('i686')
pkgdesc="The liveperson chat client. Note the liveperson app will keep itself up to date."
url=('http://liveperson.com')
source=("JRep.def.jnlp"
	'liveperson')
depends=('bash'
	'openjdk6')
md5sums=('c6fcbbb324aac8f408041963955f6390'
	'1bb7aee82ba9e0e490c66d2dc80e3274')
build() {
  mkdir -p  $pkgdir/opt/liveperson
  mkdir -p $pkgdir/usr/bin
  mv $srcdir/JRep.def.jnlp  $pkgdir/opt/liveperson/
  mv $srcdir/liveperson $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/liveperson
}
