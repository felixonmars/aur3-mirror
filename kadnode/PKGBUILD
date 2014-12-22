# Maintainer: Aleksey Frolov <atommixz@gmail.com>
# Contributor: Moritz Warning <moritzwarning@web.de>

pkgname=kadnode
pkgver=1.0.0
pkgrel=1

pkgdesc='A P2P based DNS service using the Kademlia Distributed Hash Table (DHT)'
arch=('x86_64' 'i686')
url='http://github.com/mwarning/KadNode'
license=('MIT')

source=(https://github.com/mwarning/KadNode/archive/v${pkgver}.tar.gz)

depends=('libsodium')
backup=('etc/kadnode/kadnode.conf' 'etc/kadnode/peers.txt')

install="kadnode.install"

build() {
	cd KadNode-${pkgver}
	make LFLAGS+=-lsodium FEATURES="auth lpd cmd nss"
}

package() {
	cd KadNode-${pkgver}

	install -Dm755 build/kadnode "$pkgdir"/usr/bin/kadnode
	install -Dm755 build/kadnode-ctl "$pkgdir"/usr/bin/kadnode-ctl

	install -Dm644 build/libnss_kadnode.so.2 "$pkgdir"/lib/libnss_kadnode.so.2

	# package systemd units go to /usr/lib/systemd, /etc is for admin override
	install -Dm644 archlinux/kadnode.service "$pkgdir"/usr/lib/systemd/system/kadnode.service
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	install -Dm644 misc/kadnode.conf "$pkgdir"/etc/kadnode/kadnode.conf
	install -Dm644 misc/peers.txt "$pkgdir"/etc/kadnode/peers.txt
}
sha256sums=('9b4a86016e3ab671faa96a22198576903d34a3cebadc9033e8cfe0ddf2dd2c27')
