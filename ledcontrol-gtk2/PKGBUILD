# Maintainer: Maskawanian <aur@cryingwolf.org>
pkgname=ledcontrol-gtk2
pkgver=0.5.2
pkgrel=11
pkgdesc="Ledcontrol is a package designed to show any kind of information on the unused LEDs on your keyboard. Features include blinking LEDs, animations, priority levels etc... Updated for gtk2."
arch=(i686 x86_64)
depends=(glib2)
conflicts=(ledcontrol)
provides=(ledcontrol)
replaces=(ledcontrol)
license=('gpl')
url=('http://packages.debian.org/sid/ledcontrol')
source=(
	http://ftp.de.debian.org/debian/pool/main/l/ledcontrol/ledcontrol_${pkgver}.orig.tar.gz
	http://ftp.de.debian.org/debian/pool/main/l/ledcontrol/ledcontrol_${pkgver}-${pkgrel}.1.diff.gz
	ledcontrol.rc
	)
md5sums=(
	ba20505a21e1896552cd572cc57476c7
	75a9cfc3150f31db7c84cd5d2b78e12a
	43b0ce0fdd42aece0f5b58f015188d31
	)
install=ledcontrol.install

build() {
	cd ${startdir}/src
	mv -v ledcontrol-${pkgver} ledcontrol-${pkgver}.orig || return 1
	patch -p0 < ledcontrol_${pkgver}-${pkgrel}.1.diff || return 1
	cd ledcontrol-${pkgver}.orig
	autoreconf
	ACLOCAL=aclocal-1.11 AUTOMAKE=automake-1.11 ./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
	
	mv -v ${startdir}/pkg/${startdir}/src/ledcontrol-${pkgver}.orig/usr/share/ledcontrol ${startdir}/pkg/usr/share || return 1
	mkdir -p ${startdir}/pkg/etc/rc.d || return 1
	cp ${startdir}/src/ledcontrol.rc ${startdir}/pkg/etc/rc.d/ledcontrol || return 1
	chmod +x ${startdir}/pkg/etc/rc.d/ledcontrol || return 1
} 
