# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=joost
pkgver=0
pkgrel=1
pkgdesc="A media player with twitter rolled in one"
arch=('i686' 'x86_64')
url="http://www.paulyanez.com/labs/joostair/"
license=('unknown')
depends=('adobe-air')
source=(http://www.paulyanez.com/labs/joostair/JoostMediaPlayer.air 'joost.sh')
md5sums=('5fdb1ea04ff38890bfa6d965d2e567e9' \
         'd50b8d272bb390317b14f167b491c195') 

build() {
  cd $srcdir/

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  install JoostMediaPlayer.air $pkgdir/opt/$pkgname/
  install -m755 joost.sh $pkgdir/usr/bin/joost
}

# vim:set ts=2 sw=2 et:
