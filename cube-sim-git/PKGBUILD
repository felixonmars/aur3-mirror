# Maintainer: Dave Reisner <d@falconindy.com> 
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=cube-sim-git
pkgver=1.0.0
pkgrel=1
pkgdesc="An NxNxN twisty puzzle simulator with controls intended for speed solving."
arch=('i686' 'x86_64')
url="https://github.com/Lyle-Tafoya/Cube-Simulator"
license=('GPL2')
depends=('glu' 'sfml>=2.0')
makedepends=('git')
conflicts=('cube-sim')
provides=('cube-sim')

source=("$pkgname"::'git://github.com/Lyle-Tafoya/Cube-Simulator.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  g++ -c *.cpp
  g++ -o cube-sim *.o -lGL -lGLU -lsfml-window -lsfml-system -lsfml-graphics
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  mv cube-sim $pkgdir/usr/bin/
}

