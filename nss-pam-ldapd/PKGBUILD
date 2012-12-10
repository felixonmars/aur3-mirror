# Maintainer: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

pkgname='nss-pam-ldapd'
pkgver=0.8.12
pkgrel=2
pkgdesc='LDAP module for NSS and PAM'
arch=('i686' 'x86_64')
url="http://arthurdejong.org/$pkgname/"
license=('LGPL2.1')
depends=('krb5' 'libldap' 'pam' 'libsasl')
conflicts=('pam_ldap' 'nss_ldap')
replaces=('nss-ldapd')
install='nss-pam-ldapd.install'
backup=('etc/nslcd.conf')
source=("http://arthurdejong.org/$pkgname/$pkgname-$pkgver.tar.gz"
        "http://arthurdejong.org/$pkgname/$pkgname-$pkgver.tar.gz.sig"
        "nslcd.rc.d"
        "nslcd.service")
sha1sums=('9c320172df0cdd4eca6cd97ad4c2438e6552ffe0'
          'bb2f0606f35d4adab9d1e6d171db9bef3b822149'
          '56739b0084442bd151e775ed3e03836ff2e4c400'
          '90ea2a4ee34c47387ab4488da02f94e952573537')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-pam-seclib-dir=/usr/lib/security \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/nslcd.rc.d"     "$pkgdir/etc/rc.d/nslcd"
  install -Dm644 "$srcdir/nslcd.service"  "$pkgdir/usr/lib/systemd/system/nslcd.service"
}

# vim:set ts=2 sw=2 et: