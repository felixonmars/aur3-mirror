# $Id$
# Maintainer: fauno <fauno@parabola.nu>
pkgname=miniupnpd
pkgver=1.8.20130730
pkgrel=1
pkgdesc="Lightweight UPnP IGD daemon"
arch=('i686' 'x86_64' 'mips64el')
url="http://miniupnp.free.fr"
license=('BSD')
backup=(etc/miniupnpd/miniupnpd.conf)
depends=('libnfnetlink' 'iptables>=1.4.3' 'net-tools')
makedepends=('lsb-release')
source=("http://miniupnp.free.fr/files/$pkgname-$pkgver.tar.gz"
        miniupnpd.systemd)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	CONFIG_OPTIONS="--strict --ipv6" make -f Makefile.linux config.h
	make -f Makefile.linux
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/man/man8"

	make PREFIX="$pkgdir/" -f Makefile.linux install

	rm -r "${pkgdir}/etc/init.d"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/miniupnpd.systemd" "${pkgdir}/usr/lib/systemd/system/miniupnpd.service"

	sed -i 's:/s\?bin/iptables:/usr/bin/iptables:
	        s:eth0:"`cat /etc/miniupnpd/miniupnpd.conf | '"awk -F= '/^ext_ifname/ { print \$2 }'"'`":' "${pkgdir}"/etc/miniupnpd/*.sh
	sed -i -e "s/^uuid=[-0-9a-f]*/uuid=00000000-0000-0000-0000-000000000000/
	           s/make genuuid/uuidgen/" "${pkgdir}/etc/miniupnpd/miniupnpd.conf"
        # usrmove
        cd "$pkgdir"
        mv usr/sbin usr/bin
}
sha1sums=('32eed969a6c653d6d5ccd236ee50275c933d020e'
          '64bf27526bc830d7be98a9bb48e58911afdbe735')
sha256sums=('919ab6ec719959fff9bdae3f1d83f6a39c43fa4a6d3f2c48077f43729d3d7d43'
            '2707d028f28fbb28c3a9d13605c9c738e9628f828e22288a8a1492ac93f9ad7c')
