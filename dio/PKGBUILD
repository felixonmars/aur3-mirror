# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=dio
pkgver=0.4
pkgrel=1
pkgdesc="dio is a generic input output program for X. It reads list items from stdin. These items can be played on selection, by order or randomly. Items can also be filtered or removed. dio can also generate text for stdout from user input."
arch=('i686')
url="http://code.google.com/p/dynamic-io/"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(dio-installpath.patch config.h
  http://dynamic-io.googlecode.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('6963fffd04d25d4fc7c5c3d30f587409'
         'a4d3963fb6af5ffc394d745b9bb6398d'
         'acdc75530abcbaa70f3147dd2cd153aa')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -b ../config.h ./
  patch -p1 < ../dio-installpath.patch

  make clean
  make || return 1
  make DESTDIR="$pkgdir/" install

  for i in README bin/*;
  do install -D -m 755 $i $pkgdir/usr/share/dio/$i
  done
}

# vim:set ts=2 sw=2 et:
