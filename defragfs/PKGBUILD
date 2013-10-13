# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=defragfs
pkgver=1.1.1
pkgrel=2
pkgdesc="Linux File-system defragmenter."
arch=('any')
url="http://defragfs.sourceforge.net/"
license=('GPL3')
depends=('perl')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.gz)
md5sums=('67f23a5d6526614cec2407402410279a')

package() {
  cd $srcdir
  install -Dm755 defragfs-$pkgver $pkgdir/usr/bin/defragfs
}
