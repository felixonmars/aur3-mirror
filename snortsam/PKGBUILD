# Contributor: Penguin <TGates81.at.gmail.dot.com>

pkgname=snortsam
pkgver=2.50
pkgrel=1
pkgdesc="Snort plugin that allows automated blocking of IP addresses on several firewalls."
url="http://www.snortsam.net/"
license="as-is"
depends=('snort-sam')
source=(http://www.snortsam.net/files/$pkgname/$pkgname-src-$pkgver.tar.gz)
backup=('etc/opsec.conf' 'etc/rootservers.cfg' 'etc/snortsam.conf')
md5sums=('b599e706079c170ea53fc9ec3a184e88')

build() {
	cd $startdir/src/$pkgname
	sed -i "s| -O2 | ${CFLAGS} |g" makesnortsam.sh || return 1
	sh makesnortsam.sh || return 1
	find conf/ -type d -name CVS -exec rm -rf {} \; 2>/dev/null
	find conf/ -type f -name "*.asc" -exec rm -f {} \;
	mkdir -p $startdir/pkg/{etc,usr/bin}
	install -m0644 conf/* $startdir/pkg/etc/
	install -m0755 snortsam $startdir/pkg/usr/bin/
	install -m0755 snortsam-debug $startdir/pkg/usr/bin/
}
