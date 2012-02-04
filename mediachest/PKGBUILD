# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=mediachest
pkgver=1.7.166
pkgrel=3
pkgdesc="Powerful organizer of multimedia data."
arch=('i686' 'x86_64')
url="http://mediachest.sourceforge.net/"
license=('BSD')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/sourceforge/mediachest/MediaChest-166.zip)
md5sums=('4a8ec2a0a93c0b3f542e22bdd56b7d09')

build() {
  cd $startdir

# Desktop icon
  install -Dm644 mediachest.png $pkgdir/usr/share/pixmaps/mediachest.png
  install -Dm644 mediachest.desktop $pkgdir/usr/share/applications/mediachest.desktop

  mkdir $pkgdir/home/
  mkdir $pkgdir/home/$USER/
  mkdir $pkgdir/opt/
  mv src/MediaChest/doc/ $pkgdir/home/$USER/
  cp -R src/MediaChest/ $pkgdir/opt/
}
