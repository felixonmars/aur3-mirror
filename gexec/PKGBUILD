# Contributor: NiZoX <nizox@alterinet.org>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gexec
pkgver=0.4
pkgrel=3
pkgdesc="A tool for running commands from a GUI"
arch=('i686' 'x86_64')
url="https://bitbucket.org/fboender/gexec"
license=('GPL2')
depends=('gtk2')
source=("https://bitbucket.org/fboender/gexec/downloads/gexec-$pkgver.tar.gz")
md5sums=('f10e68d5bcc206b759a2836886808d1d')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "$pkgdir/usr/bin"
	cp "$pkgname" "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/man/man1"
	cp "$pkgname.1" "$pkgdir/usr/man/man1"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
