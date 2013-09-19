# Maintainer: Bambang Purnomosidi D. P. <bdfl at bpdp dot name>
pkgname=ciao-bin
pkgver=1.14.2
pkgrel=13646
pkgdesc="General-purpose programming language (support ISO-Prolog) which supports logic, constraint, functional, higher-order, and OOP styles. From Debian package."
arch=('i686')
url="http://ciao-lang.org"
license=('LGPL' 'GPL')
conflicts=('ciao-bin-devel')
depends=('bash')
makedepends=('deb2targz')
checkdepends=()
optdepends=()
install=ciao-bin.install
provides=()
source=(http://ciao-lang.org/packages/1.14/$pkgrel/CiaoDE-$pkgver-$pkgrel.i386.deb)
md5sums=('db9a7cf8c16dc285342c179853a3c3e3')

build() {
  deb2targz CiaoDE-$pkgver-$pkgrel.i386.deb
}

check() {
  true
}

package() {
  cd $srcdir
  tar -xzvf CiaoDE-$pkgver-$pkgrel.i386.tar.gz -C "$pkgdir"
}

# vim:set ts=2 sw=2 et:
