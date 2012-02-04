# Contributor: Roman Kyrylych roman[at]archlinux.org
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=lightscribe-sdk
pkgver=1.18.6.1
pkgrel=1
pkgdesc="LightScribe Linux Public SDK"
arch=('i686')
url="http://www.lightscribe.com/downloadsection/linux/index.aspx?id=1376"
license=('custom')
makedepends=('rpmextract')
source=(http://download.lightscribe.com/ls/lightscribePublicSDK-$pkgver-linux-2.6-intel.rpm)
options=('docs')
md5sums=('e9642df131155a5b1fa128ecfc074b2f')
sha256sums=('174ccb9c39d9e115836fc696f69c8fe8ffc2a78b5f4f0185b8f930afc93e40bf')

build() {
	cd $srcdir
	rpmextract.sh lightscribePublicSDK-$pkgver-linux-2.6-intel.rpm 2> /dev/null
	mv usr $pkgdir
	mkdir -p $pkgdir/usr/share/licenses/lightscribe-sdk
	mv $pkgdir/usr/share/doc/lightscribe-sdk/linux_public_SDK_license.rtf $pkgdir/usr/share/licenses/lightscribe-sdk/license.rtf
}
