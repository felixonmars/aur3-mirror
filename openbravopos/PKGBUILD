# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=openbravopos
pkgver=2.30
pkgrel=1
pkgdesc="An elegant POS application."
arch=('i686')
url="http://www.openbravo.com"
license=('custom')
depends=('jre')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname\_$pkgver\_bin.zip)
md5sums=('93f96a8261fa1150ef2615026dffb809')

build() {
	cd $startdir/src
	mkdir -p $pkgdir/usr/{bin,share/{applications,openbravopos,licenses/openbravopos}}
	rm *.bat $pkgname\_$pkgver\_bin.zip
	cp -Rf * $pkgdir/usr/share/$pkgname
	echo -e "#!/bin/bash\n\ncd /usr/share/$pkgname/\n./start.sh" >$pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
	cp $startdir/src/licensing/Openbravo\ POS\ notice.txt $pkgdir/usr/share/licenses/$pkgname/
	install -D -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
