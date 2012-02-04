# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xalf
pkgver=0.12
pkgrel=3
pkgdesc="Provides graphical feedback when starting X11 applications"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk' 'libxmu')
source=(http://www.lysator.liu.se/~astrand/projects/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('301cd4481dfb4a4a3b1e5291e15c32fc')
url="http://www.lysator.liu.se/~astrand/projects/xalf/"
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver

  #Arch 64 fix
if [ "$CARCH" == "x86_64" ]; then
  rm config.guess config.sub
  cp "/usr/share/libtool/config/config.guess"  ./config.guess
  cp "/usr/share/libtool/config/config.sub"  ./config.sub
  chmod 755 config.guess config.sub
fi
  
  ./configure --prefix=/usr || return 1
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}
