# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=xkillall
pkgver=1.0
pkgrel=1
pkgdesc="Gently close programs during shutdown"
url="https://bbs.archlinux.org/viewtopic.php?pid=1436659#p1436659"
depends=('gcc')
source=('https://raw.githubusercontent.com/TrilbyWhite/junkdrawer/master/xkill.c')
arch=('i686' 'x86_64')
license=('GPL2')
md5sums=('160053e5faaf90824dd44c00b6327937')

build(){
	cd "$srcdir"
	gcc -o xkill xkill.c -lX11
}

package(){
	cd "$srcdir"
	install -Dm755 "$srcdir/xkill" "$pkgdir/usr/bin/xkillall"
}
