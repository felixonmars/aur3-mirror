# Maintainer (sudo): Allan McRae <allan@archlinux.org>
# Maintainer (sudo-ldap): Scott Sinclair <scott@nullis.net>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sudo-ldap
pkgver=1.8.1
pkgrel=1
pkgdesc="Give certain users the ability to run some commands as root (with LDAP support)"
arch=('i686' 'x86_64')
url="http://www.sudo.ws/sudo/"
license=('custom')
provides=('sudo=1.8.1')
conflicts=('sudo')
depends=('glibc' 'pam')
backup=('etc/sudoers' 'etc/pam.d/sudo')
source=(ftp://ftp.sudo.ws/pub/sudo/sudo-$pkgver.tar.gz 
        sudo.pam)
options=('!libtool' '!makeflags')
md5sums=('e4402f24cccc3c6697b1eeab496053dd'
         '3f5a433666a570279f9735199e541bb6')

build() {
  cd $srcdir/sudo-$pkgver || return 1

  ./configure --prefix=/usr --with-pam --libexecdir=/usr/lib \
    --with-env-editor --with-all-insults --with-logfac=auth --with-ldap \
    --with-ldap-conf-file=/etc/openldap/ldap.conf \
    --with-ldap-secret-file=/etc/openldap/ldap.secret || return 1
  make || return 1
}

package() {
  cd $srcdir/sudo-$pkgver || return 1

  make DESTDIR=$pkgdir install || return 1
  install -Dm644 $srcdir/sudo.pam $pkgdir/etc/pam.d/sudo || return 1

  install -Dm644 doc/LICENSE $pkgdir/usr/share/licenses/sudo/LICENSE || return 1
}
