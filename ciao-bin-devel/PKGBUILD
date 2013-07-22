# Maintainer: Bambang Purnomosidi D. P. <bdfl at bpdp dot name>
pkgname=ciao-bin-devel
pkgver=1.15
pkgrel=1781
pkgdesc="General-purpose programming language (support ISO-Prolog) which supports logic, constraint, functional, higher-order, and OOP styles. From Debian package. Development version"
arch=('i686')
url="http://ciao-lang.org"
license=('LGPL' 'GPL')
conflicts=('ciao-bin')
depends=('bash')
makedepends=('deb2targz')
checkdepends=()
optdepends=()
install=ciao-bin-devel.install
provides=()
source=(http://ciao-lang.org/packages/master/328b9072c080da7a9557cafe16df8d80330623c0/ciaode_$pkgver-$pkgrel.g328b907_i386.deb)
md5sums=('24215397c05641cc179dc425aa0ea623')

build() {
  deb2targz ciaode_$pkgver-$pkgrel.g328b907_i386.deb
}

check() {
  true
}

package() {
  cd $srcdir
  tar -xzvf ciaode_$pkgver-$pkgrel.g328b907_i386.tar.gz -C "$pkgdir"
}

# vim:set ts=2 sw=2 et:
