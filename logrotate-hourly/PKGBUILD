# Maintainer: Jay MJ <jskier@gmail.com>
# Based on logrotate in core, but with hourly systemd timer for more accurate hourly and size rotation of logs

pkgname=logrotate-hourly
pkgver=3.8.9
pkgrel=1
pkgdesc="Rotates system logs automatically"
conflicts="logrotate"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/logrotate/"
license=('GPL')
groups=('base')
depends=('popt' 'gzip' 'acl')
backup=('etc/logrotate.conf')
source=("https://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz"
        'paths.patch'
        'logrotate.conf'
        logrotate.{timer,service})
md5sums=('2660f30742da79870d15d042b07829f6'
         'e76526bcd6fc33c9d921e1cb1eff1ffb'
         '94dae4d3eded2fab9ae879533d3680db'
         '45ff8f4101a1145d844fa1f6ecdfe17b'
         '85560be5272ed68a88bb77a0a2293369')

build() {
	cd "$srcdir/logrotate-${pkgver}"

	patch -p0 -i "$srcdir/paths.patch"

	./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--with-acl
	make
}

check() {
	cd "$srcdir/logrotate-${pkgver}"

	make test
}

package() {
	cd "$srcdir/logrotate-${pkgver}"

	make DESTDIR="$pkgdir" install

	install -dm755 "$pkgdir/etc/logrotate.d"
	install -Dm644 "$srcdir/logrotate.conf" "$pkgdir/etc/logrotate.conf"

	install -D -m644 ${srcdir}/logrotate.timer ${pkgdir}/usr/lib/systemd/system/logrotate.timer
	install -D -m644 ${srcdir}/logrotate.service ${pkgdir}/usr/lib/systemd/system/logrotate.service
	install -d -m755 ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants
	ln -s ../logrotate.timer ${pkgdir}//usr/lib/systemd/system/multi-user.target.wants/logrotate.timer
}
