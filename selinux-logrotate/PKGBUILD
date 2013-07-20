# $Id: PKGBUILD 188802 2013-06-21 12:38:33Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Nicky726 <Nicky726@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=selinux-logrotate
_origname=logrotate
pkgver=3.8.5
pkgrel=1
pkgdesc="Tool to rotate system logs automatically with SELinux support"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/logrotate/"
license=('GPL')
groups=('selinux' 'selinux-system-utilities')
depends=('popt' 'gzip' 'selinux-usr-libselinux')
optdepends=('selinux-cronie: scheduled log rotation')
conflicts=("${_origname}")
provides=("${_origname}=${pkgver}-${pkgrel}")
backup=('etc/logrotate.conf')
source=("https://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz"
        'paths.patch'
        'logrotate.conf'
        'logrotate.cron.daily')
md5sums=('d3c13e2a963a55c584cfaa83e96b173d'
         'e76526bcd6fc33c9d921e1cb1eff1ffb'
         '86209d257c8b8bc0ae34d6f6ef057c0f'
         '3909380f8a55fa160f62ed976a8bef4b')

build() {
  cd "$srcdir/${_origname}-${pkgver}"

	patch -p0 -i "$srcdir/paths.patch"

	make WITH_ACL=yes WITH_SELINUX=yes RPM_OPT_FLAGS="$CFLAGS" EXTRA_LDFLAGS="$LDFLAGS"
}

check() {
  cd "$srcdir/${_origname}-${pkgver}"
	make test
}

package() {
  cd "$srcdir/${_origname}-${pkgver}"
	make PREFIX="$pkgdir" MANDIR="/usr/share/man" install
	mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin

	install -dm755 "$pkgdir/etc/logrotate.d"
	install -Dm644 "$srcdir/logrotate.conf" "$pkgdir/etc/logrotate.conf"
	install -Dm744 "$srcdir/logrotate.cron.daily" "$pkgdir/etc/cron.daily/logrotate"
}
