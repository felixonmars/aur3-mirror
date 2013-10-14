# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
pkgname=easyrpg-readers-git
pkgver=0.1.1.16.g8ad5525
pkgrel=1
pkgdesc="Library to parse data structure of RPG Maker 2000 and 2003 games."
arch=('i686' 'x86_64')
url="http://www.easy-rpg.org/"
license=('GPL')
depends=('expat' 'libiconv')
makedepends=('git' 'boost')
provides=('easyrpg-readers')
source=("$pkgname::git://github.com/EasyRPG/Readers.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --always | sed 's@-@.@g'
}

build() {
  cd "$srcdir/$pkgname"

  mkdir m4
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
