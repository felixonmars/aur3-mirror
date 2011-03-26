# Maintainer: Cody Maloney <cmaloney@theoreticalchaos.com>
pkgname=pam-krb5-migrate
pkgver=0.0.9
pkgrel=1
epoch=
pkgdesc="PAM Module Migrate passwords to Kerberos."
arch=('i686' 'x86_64')
url="http://samba.org/~jelmer/pam_krb5_migrate/"
license=('GPL')
depends=(heimdal)
source=(http://samba.org/~jelmer/pam_krb5_migrate/$pkgname-$pkgver.tar.gz)
md5sums=('b062e2632c62eb0ea25ba8cb7586b532')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
