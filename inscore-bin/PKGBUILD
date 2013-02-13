# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=inscore-bin
pkgver=1.00
pkgrel=2
pkgdesc="Environment for the design of Interactive Augmented Music Scores."
arch=('x86_64')
url="http://sourceforge.net/projects/inscore/"
license=('GPL')
depends=('guido')
makedepends=('deb2targz')
provides=('inscore')
conflicts=('inscore')
source=("http://sourceforge.net/projects/inscore/files/Linux/INScore-${pkgver}-ubuntu-11.10-x86_64.deb")
md5sums=('d7e0953439cac6fd653e4b889b79891d')

build() {
  cd "$srcdir" 
  deb2targz "INScore-${pkgver}-ubuntu-11.10-x86_64.deb"
}

package() {
  cd "$srcdir"
  tar -xzvf "INScore-${pkgver}-ubuntu-11.10-x86_64.tar.gz" 
  cp -rf "$srcdir/usr" "$pkgdir"
}

