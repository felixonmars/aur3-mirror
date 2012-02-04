# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=glendix-bin
pkgver=1
pkgrel=1
pkgdesc="A set of Plan9 binaries that can be run on a linux kernel with Glendix patches"
arch=('i686')
license=('LPL')
url="http://www.glendix.org"
depends=('kernel-glendix')
source=('http://www.glendix.org/code/p9pack_u1.tar.gz')
md5sums=('33dbb0e2d3230076a16a511c00656dc3')

package() {

install -d "$pkgdir/opt/glendix/bin/"
install -Dm755 $srcdir/p9/* $pkgdir/opt/glendix/bin/

}

