# Maintainer: Dominik Peteler <archlinux@with-h.at>

pkgname=logrotate-systemd
pkgver=3.8.7
pkgrel=1
pkgdesc="Rotates system logs automatically (with systemd support)"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/logrotate/"
license=('GPL')
groups=('base')
depends=('popt' 'gzip' 'acl')
optdepends=('systemd-cron: scheduled log rotation')
backup=('etc/logrotate.conf')
conflicts=('logrotate')
provides=('logrotate')
source=("https://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz"
        'paths.patch'
        'logrotate.conf'
        'logrotate.service')
md5sums=('99e08503ef24c3e2e3ff74cc5f3be213'
         'e76526bcd6fc33c9d921e1cb1eff1ffb'
         '86209d257c8b8bc0ae34d6f6ef057c0f'
         '67411c6df9dd36ee24bc2493fba91656')

build() {
	cd "$srcdir/logrotate-${pkgver}"

	patch -p0 -i "$srcdir/paths.patch"

	make WITH_ACL=yes RPM_OPT_FLAGS="$CFLAGS" EXTRA_LDFLAGS="$LDFLAGS"
}

check() {
	cd "$srcdir/logrotate-${pkgver}"
	make test
}

package() {
	cd "$srcdir/logrotate-${pkgver}"
	make PREFIX="$pkgdir" MANDIR="/usr/share/man" install
	mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin

	install -dm755 "$pkgdir/etc/logrotate.d"
	install -Dm644 "$srcdir/logrotate.conf" "$pkgdir/etc/logrotate.conf"
	install -Dm644 "$srcdir/logrotate.service" "$pkgdir/usr/lib/systemd/system/logrotate.service"
}
