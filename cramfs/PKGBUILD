# Contributor: bender02 at archlinux dot us
pkgname=cramfs
pkgver=1.1
pkgrel=1
pkgdesc="cramfs filesystem tools"
url="http://cramfs.sourceforge.net/"
license=("GPL2")
arch=('i686' 'x86_64')
source=(http://downloads.sf.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('d3912b9f7bf745fbfea68f6a9b9de30f')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -m 755 -D cramfsck $pkgdir/usr/bin/cramfsck
  install -m 755 -D mkcramfs $pkgdir/usr/bin/mkcramfs
  install -m 644 -D NOTES $pkgdir/usr/share/cramfs/NOTES
  install -m 644 -D README $pkgdir/usr/share/cramfs/README
}

# vim:set ts=2 sw=2 et:
