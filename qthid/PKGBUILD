# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=qthid
pkgver=4.0
pkgrel=1
pkgdesc="Qthid is a control application for the Funcube Dongle software defined radio receiver."
arch=('i686' 'x86_64')
url="https://github.com/csete/qthid"
license=('GPL')
depends=('qt>=4.6')
makedepends=('intltool')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-source.tar.gz 20-fcd.rules qthid.desktop)

build() {
	cd $srcdir/$pkgname-$pkgver-source

	qmake
	make
}

package() {
	install -m755 -d $pkgdir/etc/udev/rules.d
	install -m755 -d $pkgdir/usr/{bin,share/applications,share/pixmaps}

	cd $srcdir
	
	install -D -m644 20-fcd.rules $pkgdir/etc/udev/rules.d
	install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications

	cd $pkgname-$pkgver-source

	install -D -m755 $pkgname $pkgdir/usr/bin
	install -D -m644 images/$pkgname.png $pkgdir/usr/share/pixmaps
}

md5sums=('841cacde4ade9d51abdc15c7c703256d'
         '2be3bf7cba02e90cbbb9d5f6cfdaf68b'
         '218795809d9cefbc3896af5d5f322d89')
sha256sums=('8cd0d23f41427fc9663a0191aa53030eab0ee35b1f56dd61e3f7d99aea55c7eb'
            '490fdc3e16c8d6ae38894896f622531e2bf617963165ce2430a3c132d91ba5e5'
            'd825a3bbfd6fb1bf6a36b135c73b464072042184f1a446cf21a3b168e1186fd0')
