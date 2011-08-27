# Contributor: Dag Odenhall <dag.odenhall@gmail.com>
pkgname=jbofihe-bin
pkgver=0.38
pkgrel=1
pkgdesc="A parser for the lojban language"
arch=('i686')
url="http://www.rpcurnow.force9.co.uk/jbofihe/index.html"
license=('GPL')
makedepends=('deb2targz')
provides=('jbofihe')
conflicts=('jbofihe')
source=(http://http.us.debian.org/debian/pool/main/j/jbofihe/jbofihe_$pkgver-5_i386.deb)
md5sums=('2b21b9dfde596412faf91ec33de3dbe6')

build() {
  cd $startdir/src
  deb2targz jbofihe_$pkgver-5_i386.deb
  tar -xzvf jbofihe_$pkgver-5_i386.tar.gz -C $startdir/pkg
}

# vim:set ts=2 sw=2 et:
