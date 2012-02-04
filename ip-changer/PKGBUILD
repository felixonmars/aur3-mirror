# Contributor: Wesley <rudirennsau@hotmail.com>

pkgname=ip-changer
pkgver=1.5.6
pkgrel=1
pkgdesc="Open Source IP changer for Tibia versions 7.90 - 8.55"
arch=('i686' 'x86_64')
license=('GPLv3')
url="http://code.google.com/p/ip-changer/"
groups=()
depends=('qt' 'boost')
source=(http://ip-changer.googlecode.com/files/${pkgname}-v${pkgver}.tar)
backup=()
md5sums=('c84746f258c20193d0d813181168c288')

build() {
	cd ${srcdir}/${pkgname}
	cmake ./ || return 1
	make || return 1
}

package() {
	cd $srcdir/$pkgname
	mkdir -p ${pkgdir}/usr/share/${pkgname}/{icons,versions}
	mkdir -p ${pkgdir}/usr/bin/
	install -m755 ip-changer/ip-changer ${pkgdir}/usr/bin/ || return 1
	install -m644 ip-changer/icons/*.png ${pkgdir}/usr/share/${pkgname}/icons/ || return 1	
	install -m644 ip-changer/versions/* ${pkgdir}/usr/share/${pkgname}/versions/ || return 1
}
