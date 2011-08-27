# Contributor: coolkehon <coolkehon (gmail)>

pkgname=proxychains-patch
pkgver=3.1
pkgrel=4
pkgdesc="Proxychains runs programs from behind a proxy server, similar to tsocks. With Conf patch"
url="http://proxychains.sourceforge.net/"
depends=('dnsutils')
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('proxychains')
options=('!libtool')
provides=('proxychains')
backup=('etc/proxychains.conf')
source=('libproxychains.patch' "http://downloads.sourceforge.net/project/proxychains/proxychains/version%203.1/proxychains-$pkgver.tar.gz")
md5sums=('a160b96298433070f8650551e602158e'
         '4629c156001ab70aa7e98960eb513148')

build() {
  cp $startdir/libproxychains.patch $srcdir/proxychains-$pkgver
  cd $srcdir/proxychains-$pkgver

  msg "Applying Patch"
  patch -Np0 < libproxychains.patch

  msg "Building"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/etc $pkgdir/
}
