# Contributor: Ray Wang <rawang at novell dot com>

pkgname=uiautomationwinforms
pkgver=1.0
pkgrel=1
pkgdesc="Implementation of UIA providers"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Accessibility"
license=('custom:MIT/X11')
depends=('mono' 'mono-uia' 'gtk-sharp-2')
makedepends=('mono' 'mono-uia' 'intltool' 'gtk-sharp-2')
source=(http://ftp.novell.com/pub/mono/sources/uiautomationwinforms/uiautomationwinforms-1.0.tar.bz2
	MIT.X11)
md5sums=('23d1dbed988f00b4d6cdfa84b6420790'
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
