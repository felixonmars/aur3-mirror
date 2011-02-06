# Author: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=dvdcopy
pkgver=1.0.0
pkgrel=1
pkgdesc="Provides a means to easily backup a DVD9 to DVD5, among other things"
arch=('any')
url="http://pbrisbin.com/posts/$pkgname/"
license="GPL" 
depends=(bc transcode vobcopy mplayer dvdauthor cdrtools dvd+rw-tools)
source=($pkgname)

build() { 
  # install script
  install -D -m755 ./$pkgname "$pkgdir/usr/bin/$pkgname" || return 1
}
md5sums=('bf283459c3e45ef7feab6fe7b9c5878d')
