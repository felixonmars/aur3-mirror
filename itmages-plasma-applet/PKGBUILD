# Maintainer: Raizner Evgeniy <razrfalcon@gmail.com>
pkgname=itmages-plasma-applet
pkgver=0.29
pkgrel=1
pkgdesc="Plasma applet for uploading images to ITmages"
arch=('i686' 'x86_64')
url="https://launchpad.net/itmages"
license=('LGPL')
groups=('network')
depends=('kdebase-workspace' 'itmages-dolphin-extension')
makedepends=('bzr' 'qt' 'cmake')
md5sums=() #generate with 'makepkg -g'

build() {
  bzr branch lp:itmages/${pkgname}
  cd "$srcdir/$pkgname"
  lrelease ${pkgname}-*.ts
  sed -i 's/\/share\/kde4\/apps\/desktoptheme/\/share\/apps\/desktoptheme/g' CMakeLists.txt
  cmake .
  make
  make DESTDIR=$pkgdir install
} 