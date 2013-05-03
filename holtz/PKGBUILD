# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: davvil <davvil@gmail.com>
pkgname=holtz
pkgver=1.3.1
pkgrel=2
pkgdesc="A program for playing Zertz, Dvonn and Relax against human or computer players"
arch=('i686' 'x86_64')
url="http://holtz.sourceforge.net/"
license=('GPL')
depends=('wxgtk' 'boost')
source=(http://sourceforge.net/projects/holtz/files/holtz/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('3adb2486254320ce2f81f8f1e76c9e0c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
