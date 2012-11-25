# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=lxpanel-indicator-applet-plugin
_pkgname=lxpanel
pkgver=0.5.10
pkgrel=1
pkgdesc="Indicator applet plugin for LXPanel"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://launchpad.net/lxpanel"
depends=('lxpanel' 'libindicator')
makedepends=('wireless_tools')
optdepends=('indicator-application-gtk2: take menus from applications and place them in the panel'
            'indicator-sound-gtk2: unified sound menu')
options=('!libtool')
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.gz)
md5sums=('1bf3cce2a2d01c211f6897c42e8dd0bc')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	./configure --sysconfdir=/etc --prefix=/usr --enable-indicator-support
	make -C src/plugins/indicator
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make -C src/plugins/indicator DESTDIR="$pkgdir" install
}
