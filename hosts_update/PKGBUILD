# Contributor: graysky <graysky AT archlinux dot us>
pkgname=hosts_update
pkgver=1.31
pkgrel=1
pkgdesc='Injects the mvps blocklist to /etc/hosts to prevent thousands of parasites, hijackers and unwanted adware/spyware/privacy websites from working.'
arch=('any')
depends=('wget')
license=('GPL')
url=("https://github.com/graysky2/hosts_update")
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
backup=('etc/hosts.local')
sha256sums=('004cde1ca796faf284c0771691ad0433bf385dc6e153f3ef2ac93d35872437c2')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
