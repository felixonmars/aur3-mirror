# ureadahead
# Maintainer: ying
# Contributor: ying

pkgname=ureadahead
pkgver=0.100.0
pkgrel=12
pkgdesc="ureadahead is used during boot to read files in advance. readahead-list and sreadahead are out-of-date. Needs patched kernel!"
license=('GPL2')
arch=('i686' 'x86_64')
url="https://launchpad.net/ureadahead"
depends=('e2fsprogs' 'libnih' 'dbus-core')
options=(!libtool)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.orig.tar.gz
		https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver-$pkgrel.diff.gz
        ureadahead)

build() {
  cd "$srcdir"
  patch -Np0 -i ${pkgname}_$pkgver-$pkgrel.diff

  cd $pkgname-$pkgver
  ./configure --prefix /usr
 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/var/lib/ureadahead/debugfs"
  rm -r "$pkgdir/usr/etc"

  install -Dm644 "$srcdir/ureadahead" "$pkgdir/etc/rc.d/functions.d/ureadahead"
}


md5sums=('086d3f3584b7c54a0c8647c1fba6cec7'
         'b05461d3b5abdf42679a8284be50ed42'
         'f92b6f0822e02999e7d906bb9ebc48d2')
