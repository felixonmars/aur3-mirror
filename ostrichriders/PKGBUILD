# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ostrichriders
pkgver=0.6.1
pkgrel=1
pkgdesc="Ostrich Riders is a free clone of the arcade game "Joust". It's a sort of fighting arcade game for one or two players, where the players, riding flying ostriches, have to collide the opponents while being vertically higher."
arch=('i686')
url="http://sourceforge.net/projects/ostrichriders/"
license=('GPLv3')
depends=('sfml')
source=(http://downloads.sourceforge.net/sourceforge/ostrichriders/OstrichRiders061_Linux32.tar.gz)
md5sums=('56ac76b4f0dbacb5767207cc42615b61')

build() {
  cd $startdir

  mkdir $pkgdir/opt
  cp -R src/OstrichRiders061_Linux32 $pkgdir/opt
  install -Dm755 ostrich-start $pkgdir/opt/OstrichRiders061_Linux32/ostrich-start

  # Install desktop icon
  install -Dm644 ostrichriders.png $pkgdir/usr/share/pixmaps/ostrichriders.png
  install -Dm644 ostrichriders.desktop $pkgdir/usr/share/applications/ostrichriders.desktop
}
