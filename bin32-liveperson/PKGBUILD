#Maintainer: "slaveriq <arch@plassmann.biz>"
pkgname=bin32-liveperson
pkgver=9.3.0.3
license=('custom')
pkgrel=2
arch=('x86_64')
pkgdesc="The liveperson chat client. Note the liveperson app will keep itself up to date."
url=('http://liveperson.com')
source=("JRep.def.jnlp"
	'liveperson')
depends=('bash'
	'bin32-openjdk6')
md5sums=('c6fcbbb324aac8f408041963955f6390'
	'e4ed93bc4e1edc97c6bf1b8fe2e6b87e')
build() {
  mkdir -p  $pkgdir/opt/liveperson
  mkdir -p $pkgdir/usr/bin
  mv $srcdir/JRep.def.jnlp  $pkgdir/opt/liveperson/
  mv $srcdir/liveperson $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/liveperson
}
