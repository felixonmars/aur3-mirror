# Maintainer: Christoph Stahl <christoph.stahl@udo.edu>
pkgname=emv
pkgver=1.95
pkgrel=1
pkgdesc="Rename files with your favourite text editor"
url="http://www.i0i0.de/toolchest/emv"
arch=( 'any' )
license=( 'custom: Public Domain' )
depends=( 'bash' 'coreutils' )
source=( "http://www.i0i0.de/toolchest/emv" )
md5sums=('6cac67d756cc93f1567ffb88376b5bb1')

package() {
  cd "$srcdir/"  || return 1
  install -D -m755 emv $pkgdir/usr/bin/emv || return 1
}
