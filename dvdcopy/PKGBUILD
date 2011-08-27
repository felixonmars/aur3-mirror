# Author: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=dvdcopy
pkgver=1.0.2
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
md5sums=('109e73745bdf1c7502b99c83bb5d5be1')
