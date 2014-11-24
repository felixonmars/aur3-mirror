# Maintainer: Philipp Stephan <mail@ps0ke.de>

pkgname=sp
pkgver=0.1
pkgrel=1
pkgdesc="A command-line client for Spotify's dbus interface."
arch=('any')
url="https://gist.github.com/wandernauta/6800547"
license=('MIT')
depends=('spotify' 'dbus' 'grep' 'sed' 'coreutils')
source=('https://gist.githubusercontent.com/wandernauta/6800547/raw/64585cbd9725734cbd86b81222b25fbcedff4123/sp')
md5sums=('dd0621faf72a84c566ad69df96503989')

build() {
	# extract license into a seperate file
	head -n 47 $pkgname | tail -n 20 | sed -E 's/# ?//' > LICENSE

	chmod +x "$pkgname"
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
