# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=pkiclient
pkgver=5.00.28
pkgrel=1
pkgdesc="eToken PKI client"
arch=('i686' 'x86_64')
url="http://www.aladdin-rd.ru"
license=('custom')
depends=('openct' 'pcsclite' 'hal-flash')
makedepends=('libarchive>=2.4.12' 'rpmextract' 'unzip')
provides=()
conflicts=()
source=(http://www.aladdin-rd.ru/upload/iblock/55b/etokenpkiclientlinux50sp1_2009-08-18.zip)
md5sums=('a08ce8024f6b7bfa93aa289e345b2a12')

package() {
	if [[ "$CARCH" == "i686" ]]
	then
		cd "$srcdir/RPM 32/RPM files/"
		rpmextract.sh ${pkgname}-${pkgver}-0.i386.rpm
	else
		cd "$srcdir/RPM 64/RPM/"
		rpmextract.sh ${pkgname}-${pkgver}-0.x86_64.rpm
	fi

	mkdir -p $pkgdir/usr/lib/pcsc

	cp -ra etc $pkgdir/
	cp -ra lib $pkgdir/usr/
	cp -ra usr $pkgdir/
	cp -ra var $pkgdir/
	rm -rf $pkgdir/etc/rc.d
	rm -rf $pkgdir/etc/init.d
	rm -rf $pkgdir/usr/bin/eTSrv

	if [[ "$CARCH" == "x86_64" ]]
	then
		rm -f $pkgdir/usr/lib/*.so*
		cp -ra ./lib64/* $pkgdir/usr/lib
		rm -r $pkgdir/usr/lib64
		cd $pkgdir/usr/lib
		ln -s libeToken.so.5 libeTFS.so
		ln -s libeToken.so.5 libeTPkcs11.so
		ln -s libeToken.so.5 libeTSapi.so
		ln -s libeToken.so.5 libeToken.so
	fi

	cp -ra $pkgdir/usr/share/eToken/drivers $pkgdir/usr/lib/pcsc/

	cd $pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux

	ln -s libAksIfdh.so.5.00 libAksIfdh.so
}
