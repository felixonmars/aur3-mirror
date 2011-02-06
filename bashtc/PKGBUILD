# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=bashtc
pkgver=0.6.1
pkgrel=3
pkgdesc="A Twitter client for the command line on GNU/Linux operating systems."
arch=('any')
url="http://bash.gmxhome.de/scripting.html"
license=('GPL')
depends=('bash' 'curl' 'elinks' 'lynx' 'mpg123' 'procps' 'util-linux-ng')
install=(bashtc.install)
source=("http://bash.gmxhome.de/scripting/$pkgname-$pkgver")
md5sums=('e7778ce8ba5e1603bf389b4f71b1dd8c')

build() {
	install -D -m 755 ${srcdir}/$pkgname-$pkgver ${pkgdir}/usr/bin/bashtc
}
# vim:syntax=sh
