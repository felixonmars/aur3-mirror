# Maintainer: Darko Trifunovski <dtrifuno At gmail dOT com>
pkgname=loop-aes-gnupg
_origname=gnupg
pkgver=1.4.10
pkgrel=1
pkgdesc="GNU Privacy Guard - statically linked for use with loop-aes"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib' 'bzip2' 'libldap>=2.4.18' 'libusb' 'curl>=7.16.2' 'readline>=6.0.00')
conflicts=('gnupg')
provides=('gnupg')
source=(ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/gnupg/$_origname-$pkgver.tar.bz2
	gnupg-1.4.10.diff)
install=gnupg.install
url="http://www.gnupg.org/"
sha512sums=('779109950260c351556130da46d8f2847245703af78b42e5dc5371fa019a1f589ff6fdb3af1cb053f4516fcbaa2cd2566b4cf59b0b0a44b63921a0533d168adb'
            '5d512fdd450e854b0941ea3abafef903f8dddaeeba5457dfa1e19a87a213a41c1362117bfce328706ec4824c8d966aa5ccec2a0a41a32e943e9a8bb8ab553d27')

build() {
  cd ${srcdir}/${_origname}-${pkgver}
  patch -p1 -i ${srcdir}/gnupg-1.4.10.diff
  LDFLAGS="-static -s" ./configure --prefix=/usr --libexecdir=/usr/lib --enable-static-rnd=linux # docdir can't be set properly
  make || return 1
  ln -s ${_origname}-${pkgver}/scripts ..
  make DESTDIR=${pkgdir} install || return 1
  
  # fix fileconflict with gnupg2 pkg
  rm ${pkgdir}/usr/share/man/man1/gpg-zip.1
}
