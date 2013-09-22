# Maintainer: Robin Hahling "Rolinh" <robin.hahling[at]gw-computing[dot]net>
# Contributor: Stéphane Marguet (Stemp) <smarguet at gmail dot com>

pkgname=xfce4-vala
pkgver=4.10.3
pkgrel=1
pkgdesc="Vala bindings for the Xfce framework"
arch=('i686' 'x86_64')
url="http://git.xfce.org/bindings/xfce4-vala/"
license=('LGPL2.1')
depends=('vala' 'xfce4-dev-tools')
conflicts=('xfce4-vala-git')
source=("http://git.xfce.org/bindings/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.bz2")
md5sums=('91dfeff687881856277f5f53c6c4acf8')

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	export VALA_LIBS=/usr/lib
	export VALA_CFLAGS=/usr/include/vala-0.18
	./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
	--localstatedir=/var
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
