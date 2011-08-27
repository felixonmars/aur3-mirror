# Maintainer: Matthias Lehmann <mat at matlehmann dot de>

pkgname=tsocks-patched-ubuntu
pkgver=1.8beta5
pkgrel=1
pkgdesc="A transparent SOCKS proxying library with ubuntu patches (fallback)"
provides=('tsocks=1.8beta5')
conflicts=('tsocks')
arch=('i686' 'x86_64')
arch=(i686 x86_64)
url="http://tsocks.sourceforge.net"
license=("GPL")
depends=('glibc')
source=('http://archive.ubuntu.com/ubuntu/pool/universe/t/tsocks/tsocks_1.8beta5.orig.tar.gz'
    'http://archive.ubuntu.com/ubuntu/pool/universe/t/tsocks/tsocks_1.8beta5-9.1.diff.gz')
md5sums=('51caefd77e5d440d0bbd6443db4fc0f8'
         '0c27b96ca2965d7dae0c7c103943c026')

build() {
  cd $srcdir/tsocks-1.8
  patch -p1 < $srcdir/tsocks_1.8beta5-9.1.diff
  for p in debian/patches/0?_*; do
      echo "apply patch $p"
      patch -p1 < $p
  done
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --libdir=/usr/lib || return 1
  make || return 1
}

package() {
  cd $srcdir/tsocks-1.8
  make DESTDIR=$pkgdir install || return 1
}
