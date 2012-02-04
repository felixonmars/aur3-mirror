# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=zpspell
pkgver=0.4.3
pkgrel=1
url="http://www.pardus.org.tr/projeler/masaustu/zemberek-pardus/"
pkgdesc='Open Source Turkish spell checker interface for zemberek server'
arch=('i686' 'x86_64')
license=('GPL')
depends=('zemberek-server')
makedepends=('cmake' 'dbus-glib')
source=(http://cekirdek.pardus.org.tr/~baris/zpspell/$pkgname-$pkgver.tar.bz2)
md5sums=('e9ffa3e22ee59ac5b32dd798d75b1f61')

build() {
	cd ${startdir}/src/$pkgname-$pkgver
	cmake . || return 1
	make || return 1
	install -D -m755 $srcdir/$pkgname-$pkgver/zpspell $startdir/pkg/usr/bin/zpspell 
}
