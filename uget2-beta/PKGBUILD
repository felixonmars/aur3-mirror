# Maintainer: Albert Lienardi <albertlienardi@hotmail.com>

pkgname=uget2-beta
pkgver=1.99.6
pkgrel=1
pkgdesc="A lightweight and full-featured Download Manager for Linux and Windows."
arch=('i686' 'x86_64')
url="http://www.ugetdm.com"
license=('LGPL')
depends=('curl' 'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'xdg-utils')
makedepends=('intltool')
optdepends=('aria2: alternative backend')
conflicts=('uget')
provides=('uget')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::http://downloads.sourceforge.net/project/urlget/uget%20%28developing%29/$pkgver/uget-$pkgver.tar.gz)
sha256sums=('f141864af6aef614d79374cc06ff01cd3be952c775947c5eade959c04258d117')

build() {
	cd "uget-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--disable-appindicator
	make
}

package() {
	cd "uget-$pkgver"
	make DESTDIR="$pkgdir/" install
}
