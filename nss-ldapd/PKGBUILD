# Maintainer: Kaiting Chen <kaiting.chen@kiwilight.com>

pkgname='nss-ldapd'
_pkgname='nss-pam-ldapd'
pkgver='0.8.8'
pkgrel='1'
pkgdesc='LDAP module for NSS and PAM'
arch=('i686' 'x86_64')
url="http://arthurdejong.org/$_pkgname/"
license=('LGPL2.1')
depends=('heimdal' 'pam' 'libldap' 'cyrus-sasl')

backup=('etc/nslcd.conf')

md5sums=('50e4ac6180275b9c2287e4323a1cd4c6'
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
