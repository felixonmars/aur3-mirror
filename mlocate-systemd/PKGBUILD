# Maintainer: Dominik Peteler <archlinux@with-h.at>

pkgname=mlocate-systemd
pkgver=0.26
pkgrel=1
pkgdesc='Merging locate/updatedb implementation (with systemd support)'
url='https://fedorahosted.org/mlocate/'
arch=('i686' 'x86_64')
license=('GPL')
optdepends=('systemd-cron: Run service unit daily')
provides=('mlocate')
conflicts=('mlocate')
backup=('etc/updatedb.conf')
source=("https://fedorahosted.org/releases/m/l/mlocate/mlocate-${pkgver}.tar.xz"
	'updatedb.conf'
	'mlocate-update.service')
sha1sums=('c6e6d81b25359c51c545f4b8ba0f3b469227fcbc'
          '0150379149bf9d714bc81332d775fc273e7e3535'
          '6f3b707cfa7cc71f7dbf226cb823bf1b3683d964')

build() {
	cd "${srcdir}/mlocate-${pkgver}"

	sed -i '/^groupname /s/mlocate/locate/' Makefile.in
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib
	make
}

check() {
	cd "${srcdir}/mlocate-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/mlocate-${pkgver}"

	make DESTDIR="${pkgdir}" install

	chgrp 21 "${pkgdir}/usr/bin/locate"
	chmod 2755 "${pkgdir}/usr/bin/locate"
	ln -s locate "${pkgdir}/usr/bin/slocate"

	install -dm755 "${pkgdir}/var/lib"
	install -dm750 -g21 "${pkgdir}/var/lib/locate"
	
	install -Dm644 ../updatedb.conf "${pkgdir}/etc/updatedb.conf"
	install -Dm644 ../mlocate-update.service "${pkgdir}/usr/lib/systemd/system/mlocate-update.service"
}
