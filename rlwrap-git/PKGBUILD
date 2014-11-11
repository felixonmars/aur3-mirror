# $Id: PKGBUILD 115530 2014-07-11 21:36:16Z kkeen $
# Maintainer: Timmy Weerwag <timmy@timmyweerwag.nl>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Benjamin Andresen <benny AT klapmuetz DOT org>
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=rlwrap-git
pkgrel=1
pkgver=0.41.r38.gbda6569
pkgdesc="Adds readline-style editing and history to programs."
arch=('i686' 'x86_64')
url="http://utopia.knoware.nl/~hlub/uck/rlwrap/"
license=('GPL')
depends=('perl')
conflicts=('rlwrap')
provides=('rlwrap')
makedepends=('git' 'readline')
source=('git+http://github.com/hanslub42/rlwrap.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rlwrap"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/rlwrap"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/rlwrap"
  make DESTDIR="$pkgdir" install
}
