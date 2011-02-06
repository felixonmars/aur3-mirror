# Maintainer: daniel g. siegel <dgsiegel@gmail.com>

pkgname="muine-shell"
pkgver="0.6.1"
pkgrel=1
pkgdesc="muine-shell is a program to control muine remotely"
depends=('muine' 'dbus')
source=(http://desrt.mcmaster.ca/code/muine-shell/$pkgname-$pkgver.tar.gz)
url="http://desrt.mcmaster.ca/code/muine-shell"
md5sums=(b6827c7c854bd5c7ab9428de3e4b8aec)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
