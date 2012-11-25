# Maintainer: Benjamin Bolton benjamin@bennybolton.com

pkgname=xcommand
pkgver=0.1.1
pkgrel=2
pkgdesc="Run commands from outside X server"
arch=('any')
url="https://bennybolton.com/"
license=('GPL3')
depends=(openbsd-netcat bash)
source=("ftp://bennybolton.com/$pkgname/$pkgver/xcommand")
md5sums=('275c8b2d7ad60a19b92a4df58c80763d')

package(){
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/xcommand" "$pkgdir/usr/bin/xcommand"
	chmod 755 "$pkgdir/usr/bin/xcommand"
}
