# Maintainer: Your Name <cpunltd at gmail dot com>

pkgname=turbojet2
pkgver=RC1
pkgrel=1.1
pkgdesc="The TurboJet CD/DVD Duplicator"
arch=('i686' 'x86_64')
url="http://turbojet.sourceforge.net"
license=('GPL v2.0')
groups=(duplicator)
depends=('qt4' 'cdrkit' 'cdrdao' 'mpg123')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://sourceforge.net/projects/turbojet/files/TurboJet%202/$pkgver/$pkgname.tar.bz2)
noextract=()
md5sums=(1942039d0800b2aca7973bc3f22bd0e4) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"
  qmake-qt4 turbojet2.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bin/turbojet2 "$pkgdir/usr/bin/turbojet2"
}