pkgname=cryptohash-cpuminer
_gitname=cryptohash_cpuminer
epoch=1
pkgver=1.7e8c56b
pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
pkgrel=1
pkgdesc="This is a multi-threaded CPU miner for Litecoin and Bitcoin,fork of Jeff Garzik's reference cpuminer."
arch=('i686' 'x86_64')
depends=('curl' 'jansson')
makedepends=('git')
optdepends=()
license=('GPL2')
url="git://github.com/peoplescurrency/cryptohash_cpuminer/"
source=("git+https://github.com/peoplescurrency/cryptohash_cpuminer/")
md5sums=('SKIP')
build() {
	cd "${srcdir}/cryptohash_cpuminer"
	bash ./autogen.sh
	#bash ./nomacro.pl
	bash ./configure CFLAGS="-O3"
	make
}
package_cryptohash-cpuminer() {
	cd "${srcdir}/cryptohash_cpuminer"
	make DESTDIR="$pkgdir/" install
}
