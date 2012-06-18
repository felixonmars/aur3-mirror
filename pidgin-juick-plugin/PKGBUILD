# Contributor: pktfag

pkgname=pidgin-juick-plugin
pkgver=0.3.3
pkgrel=1
pkgdesc="Pidgin plugin that adds some color and button for juick bot"
arch=('i686' 'x86_64')
url="http://github.com/mad/pidgin-juick-plugin"
license=('GPL-3')
depends=('pidgin>=2.6')
makedepends=('python intltool')
source=(http://cloud.github.com/downloads/mad/pidgin-juick-plugin/$pkgname-$pkgver.zip)

md5sums=('8cb856fe9bbb2b2430bce3d027b0857c')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	./waf configure --prefix=/usr || return 1
	./waf install --destdir="$pkgdir"
}
