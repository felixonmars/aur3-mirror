# Maintainer: Corin Schedler <corin@dubdromic.com>
pkgname=mutt-trash
pkgver=1.5.21
pkgrel=1
pkgdesc="A small but very powerful text-based mail client. Patched with trash folder support."
arch=(i686 x86_64)
license=('GPL')
url="http://www.mutt.org/"
depends=('slang' 'openssl' 'gdbm' 'mime-types' 'zlib' 'libsasl' 'gpgme')
makedepends=('gnupg')
conflicts=('mutt')
install=${pkgname}.install
source=(ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz trash.diff mutt_ssl.patch mutt-unmailbox.patch)
url="http://www.mutt.org/"
md5sums=('a29db8f1d51e2f10c070bf88e8a553fd' 'd0bc85f30ba298472dcda47dae825b19' '3f54850315502ad47405421339ffae60' 'fa8e03a49a2fa7b294dc8237d928cdb7')

build() {
  cd ${srcdir}/mutt-${pkgver}
  patch -p1 < ../../trash.diff

  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-pop --enable-imap --enable-smtp \
    --with-sasl --with-ssl=/usr --without-idn \
    --enable-hcache --enable-pgp --enable-inodesort \
	 --enable-compressed --with-regex \
	 --enable-gpgme --with-slang=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
  rm -f ${pkgdir}/usr/bin/{flea,muttbug}
  rm -f ${pkgdir}/usr/share/man/man1/{flea,muttbug}.1
  rm -f ${pkgdir}/etc/mime.types*
  install -Dm644 contrib/gpg.rc ${pkgdir}/etc/Muttrc.gpg.dist
}

