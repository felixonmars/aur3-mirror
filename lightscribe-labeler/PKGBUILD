# Contributor: Roman Kyrylych roman[at]archlinux.org
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=lightscribe-labeler
pkgver=1.18.15.1
pkgrel=1
pkgdesc="LightScribe Simple Labeler"
arch=('i686')
url="http://www.lightscribe.com/downloadSection/linux/index.aspx?id=815"
license=('custom')
depends=('lightscribe' 'libstdc++5' 'libxi' 'libxcursor' 'libpng' 'fontconfig' 'libsm' 'libxrandr')
makedepends=('rpmextract')
source=(http://download.lightscribe.com/ls/lightscribeApplications-$pkgver-linux-2.6-intel.rpm)
options=('!strip')

build() {
	cd $startdir/src
	rpmextract.sh lightscribeApplications-$pkgver-linux-2.6-intel.rpm 2> /dev/null
	cp -R opt $startdir/pkg
	find $startdir/pkg -type d -exec chmod 755 {} \;
	chmod -x $startdir/pkg/opt/lightscribeApplications/SimpleLabeler/qt.conf

	mkdir -p $startdir/pkg/usr/bin
	cd $startdir/pkg/usr/bin
	ln -s ../../opt/lightscribeApplications/SimpleLabeler/SimpleLabeler lightscribe-labeler

	mkdir -p $startdir/pkg/usr/share/licenses/lightscribe-labeler
	mv $startdir/pkg/opt/lightscribeApplications/lightscribeLicense.rtf $startdir/pkg/usr/share/licenses/lightscribe-labeler/license.rtf
}
md5sums=('bf5eb9aa41e3b5f4d0c879591464c1db')
sha256sums=('2e8cf6887974ac1bd4ee8d415a4160a75b39d31d33394eb7284d7179862fa504')
