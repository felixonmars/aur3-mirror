# Contributor: Sebastien Piccand <sebcactus gmail com>
pkgname=galib
pkgver=2.4.7
pkgrel=5
pkgdesc="A C++ Library of Genetic Algorithm Components"
arch=('i686' 'x86_64')
url="http://lancet.mit.edu/ga/"
license=('BSD')
conflicts=('eo')
source=(http://lancet.mit.edu/ga/dist/${pkgname}247.tgz)
md5sums=('2b6a28fd06d4c7c4d0bb39c92b2b376c')

build() {
  cd "$srcdir"/${pkgname}`echo $pkgver | tr -d .`
  # Fix the CXXFLAGS
  make CXXFLAGS="${CXXFLAGS}" lib
}

package() {
  cd "$srcdir"/${pkgname}`echo $pkgver | tr -d .`
  # Install the BSD License
  install -D -m644 COPYRIGHT "$pkgdir"/usr/share/licenses/galib/COPYRIGHT
  mkdir "$pkgdir"/usr/lib
  make DESTDIR="$pkgdir"/usr install
  # Clean unnecessary files
  rm "$pkgdir"/usr/include/ga/{BUILD,VERSION}
}
