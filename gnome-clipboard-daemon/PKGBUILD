# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=gnome-clipboard-daemon
_pkgfile=clipboard-daemon
pkgver=1.0
pkgrel=4
pkgdesc="A program that keeps the content of your X clipboard in memory"
url="http://members.chello.nl/~h.lai/gnome-clipboard-daemon/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
makedepends=('pkgconfig')
install=$pkgname.install
source=(http://members.chello.nl/~h.lai/$pkgname/$_pkgfile-$pkgver.tar.bz2)
md5sums=('e81427c7f7b42e3fad89bdd0b384cc4e')

build() {
  cd $startdir/src/$_pkgfile-$pkgver
  make || return 1
  install -D -m755 $_pkgfile $startdir/pkg/usr/bin/$_pkgfile
}
