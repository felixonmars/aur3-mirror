# Maintainer: modywzm <modywzm at gmail dot com>
_pkgbase=MoorHuntDemo
pkgname=moorhunt-beta
pkgver=0.8.0.60
pkgrel=2
pkgdesc="Linux p2m client, running on Windows, Linux and Mac OS."
url="http://moorhunt.pl/"
arch=('i686' 'x86_64')
license=('Freeware')
depends=('mono')
provides=('${_pkgbase}')

md5sums=('26c4bd01b14ffc90460927b15c4b92c5'
         'c83a33a433291fd723bd24bd6ac10984'
         '6aa529cb42ca68d8622c187e6da454d0'
         'befeda7a02cd9fab9c431796b291cb10')
source=("https://dl.dropbox.com/s/4huzo0b3o02s3gk/MoorHuntDemo.tar.bz2?dl=1"
        "moorhunt"
        "moorhunt.desktop"
        "moorhunt.png")

build() {
  install -Dm644 moorhunt.png $pkgdir/usr/share/pixmaps/moorhunt.png
  install -Dm644 moorhunt.desktop $pkgdir/usr/share/applications/moorhunt.desktop
  mkdir -p $pkgdir/opt
  cp -r ${_pkgbase} $pkgdir/opt
  chmod -R 777 $pkgdir/opt/${_pkgbase}
  install -Dm755 $srcdir/moorhunt $pkgdir/usr/bin/moorhunt
}
