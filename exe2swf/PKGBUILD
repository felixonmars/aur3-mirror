# Maintainer: Aleksei Lissitsin <aleksei.lissitsin@gmail.com>
pkgname=exe2swf
pkgver=0
pkgrel=2
pkgdesc="A tool for extraction of swf files that are builtin into an exe project"
arch=('i686' 'x86_64')
url="https://bitbucket.org/yupi/exe2swf"
license=('GPL2+')
groups=()
depends=()
makedepends=(gcc)
provides=()
conflicts=()
replaces=()
source=(https://bitbucket.org/yupi/exe2swf/downloads/exe2swf.c)
md5sums=('e6d1b382a4499e1ca0613683c73c6a75')

build() {
  cd "$srcdir"
  gcc $pkgname.c -o $pkgname	
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$pkgname $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/$pkgname
}

