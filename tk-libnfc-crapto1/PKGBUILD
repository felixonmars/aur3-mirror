# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname=tk-libnfc-crapto1
pkgver=0.3
pkgrel=1
pkgdesc="MFCUK - Toolkit containing samples and various tools based on and around libnfc and crapto1, with emphasis on Mifare Classic NXP/Philips RFID cards"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tk-libnfc-crapto1/"
license=('GPL2')
depends=("libnfc")
source=("http://$pkgname.googlecode.com/files/MFCUK_darkside_$pkgver.zip")

md5sums=('5ca56ac4984c0343c0ba7ff77323c62f')
sha512sums=('067075f6f215f3c9ec3848c3ff3caad21e114e071671c11b5fe9e228e3fb5baf1e8a4888cdcdf24f1c976213ca853959fc6c735e3bf8619bc8c0bc89ea2c06cf')

build()
{
 cd $srcdir/$pkgver || return 1
 ./configure --with-libnfc=/usr --prefix=/usr || return 1
 make || return 1
 make DESTDIR=$pkgdir install || return 1
}
