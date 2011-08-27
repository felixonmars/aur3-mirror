# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: whaevr <whaevr[at]gmail[dot]com>
pkgname=multisync-gui
pkgver=0.91.0
pkgrel=4
pkgdesc="Graphical Interface for the OpenSync Synchronization Framework"
url="http://www.opensync.org"
license="LGPL"
arch=('i686' 'x86_64')
depends=('libopensync' 'libglade')
source=(http://www.opensync.org/attachment/wiki/releases/0.2x/download/$pkgname-$pkgver.tar.gz?format=raw)
md5sums=('3760eef2216f3905f21491b6b345d07f')
sha1sums=('03b32007dab9945ee08affe6ac59be34f565adcb')

build() {
	cd $srcdir
	mv $pkgname-$pkgver.tar.gz?format=raw $pkgname-$pkgver.tar.gz
	tar xzvf $pkgname-$pkgver.tar.gz
	cd $pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$pkgdir install
}
