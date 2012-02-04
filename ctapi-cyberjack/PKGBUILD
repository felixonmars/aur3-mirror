# Contributor: Nylan <Nylan@gmx.net>
pkgname=ctapi-cyberjack
pkgver=3.3.5
pkgrel=2
pkgdesc="Driver for Reiner SCT cyberjack Cardreaders"
arch=(i686 x86_64)
url="http://support.reiner-sct.de/"
license=('LGPL')
depends=('libusb' 'hal' 'pcsclite')
makedepends=('pkgconfig')
source=(http://support.reiner-sct.de/downloads/LINUX/V$pkgver/$pkgname-$pkgver.tar.gz
	cyberjack-3.3.5-udev.patch
	cyberjack.sh
        )
md5sums=(baa6c975e534e005dc245adfa106e1ce
	 8eb748ff84b0be3ca0c683e6ab21a75c	
	 d73545518736f8024a745bf7f9b1b5a2
        )

install=(ctapi-cyberjack.install)

build() {
  cd $startdir/src/$pkgname-$pkgver
  cp ${srcdir}/cyberjack.sh etc/udev
  patch -Np1 -i ${srcdir}/cyberjack-3.3.5-udev.patch
  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc/$pkgname \
	--enable-pcsc  \
        --enable-udev \
	--enable-fox \
        --with-usbdropdir=$(pkg-config libpcsclite --variable=usbdropdir) \
	--disable-dependency-tracking \
  
  make || return 1
  make DESTDIR=$startdir/pkg install ||return 1
}
