# Contributor: aurelien <aurelien@archlinux.org>
# Contributor: kclive18 <vsingh16@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>

pkgname=xfce4-mixer-oss4
_pkgname=xfce4-mixer
pkgver=4.10.0
pkgrel=1
pkgdesc="The volume control plugin for the Xfce panel, with OSS4 support."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('xfce4-panel' 'oss' 'libunique')
makedepends=('intltool' 'xfce4-dev-tools')
conflicts=('xfce4-mixer')
provides=('xfce4-mixer')
options=('!libtool')
install=${pkgname}.install
source=(http://git.xfce.org/apps/$_pkgname/snapshot/$_pkgname-$pkgver.tar.bz2)
sha256sums=('1902664a524cb944ec6a9c868dcf7d20df704f5a0cfc54c523226afb8e1209bc')

build() {
	cd ${srcdir}/$_pkgname-${pkgver}

	./autogen.sh
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/xfce4 \
		--localstatedir=/var \
		--disable-static \
		--disable-debug \
		--with-sound=oss 
	make
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	make DESTDIR=${pkgdir} install
}
