# Maintainer: Bjørnar Hansen <tilbjornar gmail.you-guess-the-rest>
#
# PKGBUILD lovingly copied from the AUR package nagios-nsca.

pkgname=nagios-nsca-ng
pkgver=1.3
pkgrel=1
pkgdesc="Integrate passive alerts and checks from remote machines and applications with Nagios. Useful for processing security alerts, as well as redundant and distributed Nagios setups."
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
options=(!libtool)
install="$pkgname.install"
backup=('etc/nsca-ng/nsca-ng.cfg' 'etc/nsca-ng/send_nsca.cfg')
url="http://www.nagios.org/"
source=("http://www.nsca-ng.org/download/nsca-ng-${pkgver}.tar.gz"
        'systemd.nsca')
md5sums=('8e26a8a5c4c49f8c9c392f21629c74a3'
         'd7db34ba4cdb00f0311bae8311103682')

build() {
	cd $srcdir/nsca-ng-$pkgver

	./build-aux/make-confuse

	./configure \
	    --prefix=/usr \
	    --sbindir=/usr/bin \
	    --sysconfdir=/etc/nsca-ng \
    	    --with-nsca-user=nsca \
	    --with-nsca-grp=nsca \
	    --enable-server

	make all
}

package() {
 	cd $srcdir/nsca-ng-$pkgver

	make DESTDIR="$pkgdir" install

	# install systemd "unit file"
	install -D -m755 $srcdir/systemd.nsca $pkgdir/usr/lib/systemd/system/nsca-ng.service
}

# vim:set ts=2 sw=2 et:
