# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=varna
pkgver=3.9
pkgrel=3
pkgdesc="A Java lightweight component and applet for drawing the RNA secondary structure"
arch=(any)
url="http://varna.lri.fr"
license=('GPL')
depends=(java-runtime)
noextract=(VARNAv${pkgver/./-}.jar)
source=(http://varna.lri.fr/bin/VARNAv${pkgver/./-}.jar)
md5sums=('9f584b94576bd1ec0b249171f523b823')

package() {
	cd "$srcdir"
    install -D VARNAv${pkgver/./-}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
    install -d "${pkgdir}/usr/bin/"
    echo '#! /bin/sh' > "${pkgdir}/usr/bin/${pkgname}"
    echo "\${JAVA_HOME}/bin/java -jar /usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" >> "$pkgdir/usr/bin/${pkgname}"
    chmod a+x "${pkgdir}/usr/bin/${pkgname}"
}
