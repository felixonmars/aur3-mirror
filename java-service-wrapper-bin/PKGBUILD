# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: Artyom Olshevskiy <siasia@siasia>

pkgname=java-service-wrapper-bin
pkgver=3.5.19
pkgrel=1
pkgdesc="Enables a Java Application to be run as a Windows Service or Unix Daemon"
url="http://wrapper.tanukisoftware.com"
arch=('i686' 'x86_64' 'armv6h')
license=('GPL2')
conflicts=('java-service-wrapper')
provides=('java-service-wrapper')

_url="http://wrapper.tanukisoftware.com/download/${pkgver}"
if [[ "$CARCH" = "i686" ]]; then
	source=("${_url}/wrapper-linux-x86-32-${pkgver}.tar.gz")
	md5sums=('8df24edeb1a9d8a5a90343b6b9959d81')
elif [[ "$CARCH" = "x86_64" ]]; then
	source=("${_url}/wrapper-linux-x86-64-${pkgver}.tar.gz")
	md5sums=('09f6865df57fa53ba0b76c97046bc691')
elif [[ "$CARCH" = arm* ]]; then
	source=("${_url}/wrapper-linux-armel-32-${pkgver}.tar.gz")
	md5sums=('8ff6bae3258d44940f875908ec9e71a2')
fi

package() {
	cd ${srcdir}/wrapper-linux-*
	install -Dm644 doc/wrapper-community-license-1.1.txt "${pkgdir}/usr/share/licenses/java-service-wrapper/LICENSE"
    install -Dm755 bin/wrapper       "${pkgdir}/usr/bin/java-service-wrapper"
    install -Dm644 lib/libwrapper.so "${pkgdir}/usr/lib/java-service-wrapper/libwrapper.so"
    install -Dm644 lib/wrapper.jar   "${pkgdir}/usr/share/java/wrapper-${pkgver}.jar"
    ln -s /usr/share/java/wrapper-${pkgver}.jar "${pkgdir}/usr/share/java/wrapper.jar"
}
