# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
pkgname=playttyrec
pkgver=1.0
pkgrel=3
pkgdesc="a player for recorded nethack games produced by dgamelaunch"
arch=('i686')
url="http://www.stack.nl/~jilles/games/"
license=('custom:BSD')
depends=(glibc)
source=("http://www.stack.nl/~jilles/games/playttyrec.c")
md5sums=('6d0a973e00adfbfb5766d2ae26c799d9')

build() {
  cd $startdir/src
	head -n32 playttyrec.c > license.txt
  gcc -o playttyrec playttyrec.c
  install -Dm755 playttyrec $startdir/pkg/usr/bin/playttyrec
	install -Dm644 license.txt $startdir/pkg/usr/share/licenses/${pkgname}/license.txt
}
