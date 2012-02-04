# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>

_pkgname=mutt
pkgname=mutt-patchy
pkgver=1.5.20
pkgrel=4
_debver=9+squeeze1
pkgdesc="A small but very powerful text-based mail client. Development version patched with debian patches."
arch=(i686 x86_64)
license=('GPL')
url="http://www.mutt.org/"
depends=('slang' 'krb5' 'libidn' 'openssl>=0.9.8e' 'gdbm' 'mime-types' 'zlib' 'libsasl' 'gpgme' 'ncurses')
makedepends=('gnupg' 'docbook-xsl' 'quilt' 'xmlto')
conflicts=('mutt')
provides=('mutt')
install=${pkgname}.install
source=("ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/m/mutt/mutt_${pkgver}-${_debver}.diff.gz"
        "mutt_ssl.patch")
md5sums=('027cdd9959203de0c3c64149a7ee351c'
         '9fd9ef1b2256c9e8f2e1becbdb960482'
         '61ad2483aabe140a06d2ff3c325f1f66')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/${_pkgname}_${pkgver}-${_debver}.diff
  QUILT_PATCHES=${srcdir}/${_pkgname}-${pkgver}/debian/patches quilt push -a
  patch -Rp1 -i debian/patches/debian-specific/build_doc_adjustments.diff
  patch -Rp1 -i debian/patches/debian-specific/Muttrc
  patch -Rp1 -i debian/patches/debian-specific/use_usr_bin_editor.diff
  patch -Np1 -i ${srcdir}/mutt_ssl.patch
  autoreconf --install --include=m4 
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-pop --enable-imap --enable-smtp \
    --enable-hcache --enable-pgp --with-regex \
    --with-curses --enable-fcntl \
    --with-idn --with-gss --with-gnutls \
    --with-sasl --with-curses --with-ssl=/usr \
     --enable-gpgme --with-slang=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -f ${pkgdir}/usr/bin/{flea,muttbug}
  rm -f ${pkgdir}/usr/share/man/man1/{flea,muttbug}.1
  rm -f ${pkgdir}/etc/mime.types*
  install -Dm644 contrib/gpg.rc ${pkgdir}/etc/Muttrc.gpg.dist
}
