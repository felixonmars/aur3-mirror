# Contributor: ugkbunb
# Contributer: N30N <archlinux@alunamation.com>

pkgname=nfblock
pkgver=0.6.2
pkgrel=1
pkgdesc="Netfilter blocking daemon inspired by MoBlock and PeerGuardian."
url="http://sites.google.com/site/makovick/nfblockd-daemon"
arch=("i686", "x86_64")
license=("GPL2")
depends=("libnetfilter_queue" "libnfnetlink" "iptables" "zlib")
source=("http://sites.google.com/site/makovick/projects/${pkgname}-${pkgver}.tgz" \
	"nfblock.install" \
	"nfblock")
md5sums=("5b9440e5d1aa0d4917edd45e75e0b00a" \
	"94022011b40d43cc43f528dc3d36202d" \
	"8de3f7710a32b339b3866931be478e63")
install="nfblock.install"

build() {
	cd ${pkgname}-${pkgver}
	make prefix="/usr"

	# Remove ENABLE setting.
	sed -e "1,2d" -i debian/default
	sed -e "3d" -i debian/cron.*

	# Blocklist extention update.
	sed "s/\(nipfilter\).zip/\1.dat.gz/" -i debian/default
}

package() {
	cd ${pkgname}-${pkgver}
	make prefix="/usr" DESTDIR="${pkgdir}" install

	install -d ${pkgdir}/var/lib/nfblock
	install -Dm744 ${srcdir}/nfblock ${pkgdir}/etc/rc.d/nfblock
	install -Dm644 debian/default ${pkgdir}/etc/default/nfblock
	install -Dm755 debian/cron.daily  ${pkgdir}/etc/cron.daily/nfblock
	install -Dm755 debian/cron.weekly ${pkgdir}/etc/cron.weekly/nfblock
}

# vim: noet ff=unix
