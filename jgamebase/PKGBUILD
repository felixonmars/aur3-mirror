# Maintainer: Gene Ruebsamen <gururise@gmail.com>
# Contributor: Tsan-Kuang Lee
pkgname=jgamebase
pkgver=0.64.4
pkgrel=1
#epoch=
pkgdesc="A sister-application of GameBase 64. It is an emulator front-end intended to provide a convenient way of playing classic video games. 
Multiple databases are available for Apple, Atari, Commodore, Nintendo and Sinclair systems."
arch=('any')
url="http://jgamebase.sourceforge.net/"
license=('GPL3')
depends=('java-runtime')
optdepends=('vice: Commodore 64 emulator to be executed from jGamebase')
provides=('jgamebase')
source=(http://downloads.sourceforge.net/project/jgamebase/jGameBase/V0.64-4/jgamebase_0.64-4_all.deb)
md5sums=('361ec170c26f6536f7d2dd0274f2f494')

build() {
  ar xv jgamebase_0.64-4_all.deb
  cd "$srcdir"
  rm -f control.tar.gz
  rm -f debian-binary
  tar xvJf data.tar.xz
  rm data.tar.xz
  rm jgamebase_0.64-4_all.deb
  cd ..
  rm jgamebase_0.64-4_all.deb
}

package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin/"
  mkdir "$pkgdir/usr/share"
  rm -rf menu
  cd "$srcdir/usr/games"
  cp jgamebase "$pkgdir/usr/bin/"
  cd "$srcdir/usr/share"
  cp -R ./applications "$pkgdir/usr/share/applications"
  cp -R ./doc "$pkgdir/usr/share/"
  cp -R ./games/ "$pkgdir/usr/share/"
  cp -R ./man/ "$pkgdir/usr/share/"
  cp -R ./pixmaps/ "$pkgdir/usr/share/"
}
