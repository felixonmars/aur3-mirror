pkgname=ldapscripts
pkgver=2.0.1
pkgrel=1
pkgdesc="Shell scripts that allow to manage POSIX accounts (users, groups, machines) in an LDAP directory"
arch=('any')
url="http://contribs.martymac.org/"
license=('GPL')
depends=('sharutils')
source=(http://contribs.martymac.org/ldapscripts/${pkgname}-${pkgver}.tgz)
md5sums=('212a62b3e808faf8d347429ccd2cef09')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" \
  ETCDIR=/etc/ldapscripts \
  MANDIR=/usr/share/man \
  LIBDIR=/usr/share/ldapscripts \
  PREFIX=/usr install || return 1
}
