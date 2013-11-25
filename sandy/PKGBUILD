#Contributor: Rafael Garcia <rafael.garcia.gallego@gmail.com>

pkgname=sandy
pkgver=0.5
pkgrel=1
pkgdesc="Simple ncurses text editor"
url="http://tools.suckless.org/sandy"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('pkgconfig')
depends=('ncurses')
optdepends=('dmenu: X11 integration' 'xsel: X11 integration')
source=(https://bitbucket.org/rafaelgg/sandy/get/0.5.tar.gz)
md5sums=('e5bcc622e681779167c488c55f79771e')

build() {
	cd $srcdir/rafaelgg-sandy-e9542fce5efa
	make PREFIX=/usr DESTDIR=$pkgdir clean install || return 1
	install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

