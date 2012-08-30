# Maintainer: Sven Schober <sschober@sssm.de>

pkgname='nslcd'
_pkgname='nss-pam-ldapd'
pkgver='0.8.10'
pkgrel='1'
pkgdesc='LDAP module for NSS and PAM'
arch=('i686' 'x86_64')
url="http://arthurdejong.org/$_pkgname/"
license=('LGPL2.1')
depends=('krb5' 'pam' 'libldap' 'cyrus-sasl')
conflicts=('nss_ldap' 'pam_ldap' 'nss-ldapd')
replaces=('nss_ldap' 'pam_ldap' 'nss-ldapd')
provides=('nss-ldapd')

backup=('etc/nslcd.conf')
install=nslcd.install

md5sums=('8f76fefe50888bee09f7732102376342'
         '42d7285523b23a077e1133eb3eac5ea3')

source=(
  "$url$_pkgname-$pkgver.tar.gz" nslcd.rc.d)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix='/usr' \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --localstatedir=/var \
    --enable-sasl \
    --with-pam-seclib-dir=/usr/lib \
    --with-nslcd-pidfile=/var/run/nslcd.pid \
    --with-nslcd-socket=/var/run/nslcd.sock
  make; make DESTDIR="$pkgdir" install
  install -Dm755 $srcdir/nslcd.rc.d $pkgdir/etc/rc.d/nslcd
}
