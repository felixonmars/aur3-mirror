# Contributor: kalio

pkgname=mpio
pkgver=0.7.1_pre2
pkgrel=1
pkgdesc="Interface for managing MPIO/Digitalway audio players"
license=('GPL')
arch=('i686' 'x86_64')
url="http://mpio.sourceforge.net/"
depends=('bash' 'libusb>=0.1.7')
source=(http://downloads.sourceforge.net/project/mpio/mpio%20pre-release/0.7.1-pre2/mpio-0.7.1_pre2.tar.gz)
md5sums=('c15e771455c4f4a883df78e2c83b128b')

build () {
  cd $srcdir/$pkgname-$pkgver

  patch -p0 -i $startdir/configure.patch

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  mv $pkgdir/usr/etc/* $pkgdir/etc/
  rmdir $pkgdir/usr/etc
}
