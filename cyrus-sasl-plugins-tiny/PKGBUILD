# $Id: PKGBUILD 75332 2010-04-01 10:36:02Z allan $
# Maintainer: Chris Darnell <cedeel@gmail.com>

pkgname=cyrus-sasl-plugins-tiny
pkgver=2.1.23
pkgrel=2
pkgdesc="Cyrus Simple Authentication Service Layer (SASL) library without PostgreSQL or MySQL dependencies"
arch=('i686' 'x86_64')
url="http://cyrusimap.web.cmu.edu/"
license=('custom')
depends=('heimdal>=1.2-1' 'libldap>2.4' 'sqlite3')
replaces=(cyrus-sasl-plugins)
conflicts=(cyrus-sasl-plugins)
provides=("cyrus-sasl-plugins=${pkgver}")
source=(ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-sasl-${pkgver}.tar.gz
        cyrus-sasl-2.1.22-gcc44.patch
        cyrus-sasl-2.1.23-db.patch)
md5sums=('2eb0e48106f0e9cd8001e654f267ecbc'
         '5deb4d67b53ecba20c7887fc8fdebee1'
         'b7daa4be00ee099ec51c7fb718bb020b')

build() {
  cd ${srcdir}/cyrus-sasl-${pkgver}
  patch -Np1 -i $srcdir/cyrus-sasl-2.1.22-gcc44.patch || return 1
  patch -Np1 -i $srcdir/cyrus-sasl-2.1.23-db.patch || return 1

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-login \
    --disable-plain \
    --disable-sql \
    --with-sqlite=/usr \
    --enable-gssapi=/usr/include/gssapi \
    --enable-ldapdb \
    --with-ldap=/usr
  cd sasldb
  make
  cd ../plugins
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING

  rm -f ${pkgdir}/usr/lib/sasl2/libsasldb.*
}
