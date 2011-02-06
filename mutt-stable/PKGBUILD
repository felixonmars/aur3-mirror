pkgname=mutt-stable
pkgver=1.4.2.3
pkgrel=2
pkgdesc="A small but very powerful text-based mail client"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mutt.org/"
depends=('slang' 'openssl' 'mime-types')
makedepends=('gnupg')
source=(ftp://ftp.mutt.org/mutt/mutt-${pkgver}.tar.gz)
url="http://www.mutt.org/"
md5sums=('dcb94661827dd090fa813e73e122ea0c')

build() {
  cd ${srcdir}/mutt-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
	  --with-docdir=/usr/share/doc/mutt \
	  --enable-imap --enable-pgp --with-regex 

  make || return 1
  make DESTDIR=${pkgdir} install
  rm -f ${pkgdir}/etc/mime.types*
}
