pkgname=scangearmp-mp270
pkgver=1.40
pkgrel=3
_pkgver=1.40-1
pkgdesc="Canon Scanner Driver (For Multifunction MP270)"
url="http://support-au.canon.com.au/EN/search?v:project=ABS-EN&binning-state=model%3d%3dPIXMA%20MP270%0Amenu%3d%3dDownload%0Aos%3d%3dLinux&"
arch=('i686')
license=('custom')
depends=('sane')
makedepends=('rpmextract')
source=(http://gdlp01.c-wss.com/gds/9/0100002369/01/${pkgname}series-${_pkgver}-i386-rpm.tar.gz)
md5sums=('0adda3ba383abda7f7a117ec5e919faf')

build() {
	cd ${srcdir}
	install -d ${pkgdir}
	tar -xzf ${pkgname}series-${_pkgver}-i386-rpm.tar.gz
	cd ${pkgname}series-${_pkgver}-i386-rpm/packages
	rpmextract.sh scangearmp-common-${_pkgver}.i386.rpm
	rpmextract.sh ${pkgname}series-${_pkgver}.i386.rpm
	mv usr/local/bin usr/bin
	mv usr/local/share/* usr/share
	rmdir usr/local/share
	rmdir usr/local
	mv "etc" "usr" ${pkgdir}
}
