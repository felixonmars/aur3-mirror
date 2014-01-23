# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
pkgname=factplusplus
pkgver=1.6.2
pkgrel=2
pkgdesc="New generation OWL-DL reasoner"
arch=('i686' 'x86_64')
url="http://owl.man.ac.uk/factplusplus/"
license=('GPL')
depends=( jdk7-openjdk xerces-c )
source=( "http://factplusplus.googlecode.com/files/FaCTpp-src-v${pkgver}.tgz" )
md5sums=( '0d0ed4a3f3ea333ae05f7c9ea2eba4e3' ) #autofill with 'updpkgsums'

build() {
  cd "$srcdir/FaCT++-$pkgver/src"

  incs=(
        -I/usr/lib/jvm/java-7-openjdk/include/
        -I/usr/lib/jvm/java-7-openjdk/include/linux/
    )

  make INCLUDES="${incs[*]}"
}

package() {
  cd "$srcdir/FaCT++-$pkgver/src"
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/lib/"
  install FaCT++/FaCT++                     "$pkgdir/usr/bin/"
  install FaCT++.JNI/libFaCTPlusPlusJNI.so  "$pkgdir/usr/lib/"
}
