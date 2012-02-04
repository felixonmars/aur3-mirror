# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=bashic
pkgver=0.1.2
pkgrel=4
pkgdesc="An identi.ca client for the command line on GNU/Linux operating systems."
arch=('any')
url="http://bash.gmxhome.de/scripting.html"
license=('GPL')
depends=('bash' 'curl' 'elinks' 'lynx' 'mpg123' 'procps' 'util-linux-ng')
install=(bashic.install)
source=("http://bash.gmxhome.de/scripting/$pkgname-$pkgver")
md5sums=('cf43356c4769761fa1681cd901c4f96b')

build() {
	install -D -m 755 ${srcdir}/$pkgname-$pkgver ${pkgdir}/usr/bin/bashic
}
# vim:syntax=sh
