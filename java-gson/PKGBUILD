# Maintainer: Daniel Spies <ds20150201aur at pskx dot net>

pkgname=java-gson
_srcname=google-gson
pkgver=2.3.1
pkgrel=1
pkgdesc='Java library to convert Java Objects into JSON and back'
arch=('any')
url='http://code.google.com/p/google-gson/'
license=('APACHE')
depends=('java-environment')
conflicts=('google-gson')
replaces=('google-gson')
source=(
	"http://search.maven.org/remotecontent?filepath=com/google/code/gson/gson/${pkgver}/gson-${pkgver}.jar"
	"http://search.maven.org/remotecontent?filepath=com/google/code/gson/gson/${pkgver}/gson-${pkgver}-javadoc.jar"
	"http://search.maven.org/remotecontent?filepath=com/google/code/gson/gson/${pkgver}/gson-${pkgver}-sources.jar"
)
sha256sums=(
	"13f44a2f6ead058da80a91ee650c073871942468e684a9bf6a0d0319138924ce"
	"59d5193d515209f57357d1486f56f82750251404fed4b3d3f36e38288c4324a0"
	"2f2bfe44fad034b526caeb600f3cfca056a143c6c9fbd239f5cbcae4e862b8fa"
)

package() {
    install -d -m755 ${pkgdir}/usr/share/java/${pkgname}/
    install -m755 \
        ${srcdir}/gson-${pkgver}.jar \
        ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
    install -m755 \
        ${srcdir}/gson-${pkgver}-javadoc.jar \
        ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}-javadoc.jar
    install -m755 \
        ${srcdir}/gson-${pkgver}-sources.jar \
        ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}-sources.jar
    ln -s /usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
    ln -s /usr/share/java/${pkgname}/${pkgname}-${pkgver}-javadoc.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-javadoc.jar
    ln -s /usr/share/java/${pkgname}/${pkgname}-${pkgver}-sources.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-sources.jar
}

