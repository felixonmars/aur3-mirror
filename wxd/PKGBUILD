#Maintainer: Tehacjusz F. < thc at weedsmoker dot im >

pkgname=wxd
pkgver=0.16
pkgrel=1
pkgdesc="D binding for wxWidgets"
arch=('i686' 'x86_64')
url="http://wxd.sourceforge.net/"
license=('LGPL')
depends=('wxgtk' 'dmd' 'libphobos')
source=("http://downloads.sourceforge.net/project/wxd/wxD/0.16/wxd-0.16.tgz")
md5sums=('cf2b9f853ede6fd72b02e2afe2c30632')

build() {
	cd ${srcdir}/wxd
	make prefix=/usr DESTDIR=${pkgdir} install
}
