# Contributor: Ray Wang <raywang at gnome dot org>

pkgname=mono-uia
pkgver=1.0
pkgrel=1
pkgdesc="Implementations of members and interfaces based on MS UIA API"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Accessibility"
license=('custom:MIT/X11')
depends=('mono')
makedepends=('mono')
source=(http://ftp.novell.com/pub/mono/sources/mono-uia/mono-uia-1.0.tar.bz2
	MIT.X11)
md5sums=('4547fe3947973a62ffc112108f9658c1'
	 '03813a921754a458569e3fb8c182d596')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1

	#install license
	mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname
	install -m 644 ${startdir}/MIT.X11 ${startdir}/pkg/usr/share/licenses/$pkgname/
}
