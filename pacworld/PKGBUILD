# Contributor: Stefano Zamprogno <stefano.zamprogno@gmail.com> 
pkgname=pacworld
pkgver=0.3.5
pkgrel=1
pkgdesc="Tool to check pacman database consistency and fix broken packages"
url="http://www.zamprogno.it/"
arch=('i686' 'x86_64')
license="GPL"
depends=('python2')
makedepends=()
source=(http://dl.dropbox.com/u/7614523/Archlinux/AUR/pacworld/$pkgname-$pkgver.tar.xz)
md5sums=('5db3f7f18faf50e92f6d37556036dd95')
backup=(etc/pacworld/pacworld.not)

build() {
  cd $startdir/src/$pkgname
  install -D -m 644 $pkgname.not $startdir/pkg/etc/$pkgname/$pkgname.not
  install -D -m 755 $pkgname $startdir/pkg/usr/bin/$pkgname
}
