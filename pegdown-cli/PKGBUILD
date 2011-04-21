# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=pegdown-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="A CLI tool to render Markdown text to HTML"
arch=('any')
url="http://code.pi.co.ua/pegdown-cli"
license=('APACHE')
depends=('java-runtime' 'args4j' 'parboiled>=0.11.1' 'pegdown>=0.9.2')
source=(${url}/downloads/${pkgname}-${pkgver}.jar pegdown.sh)
changelog=${pkgname}.ChangeLog.markdown

package() {
	cd $srcdir

	install -D -m 755 pegdown.sh $pkgdir/usr/bin/pegdown
	install -D -m 644 ${pkgname}-${pkgver}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
	ln -s ${pkgname}-${pkgver}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
	ln -s /usr/share/java/args4j/args4j.jar $pkgdir/usr/share/java/${pkgname}/args4j.jar
	ln -s /usr/share/java/asm/asm.jar $pkgdir/usr/share/java/${pkgname}/asm.jar
	ln -s /usr/share/java/asm/asm-analysis.jar $pkgdir/usr/share/java/${pkgname}/asm-analysis.jar
	ln -s /usr/share/java/asm/asm-tree.jar $pkgdir/usr/share/java/${pkgname}/asm-tree.jar
	ln -s /usr/share/java/asm/asm-util.jar.jar $pkgdir/usr/share/java/${pkgname}/asm-util.jar.jar
	ln -s /usr/share/java/parboiled/parboiled-core.jar $pkgdir/usr/share/java/${pkgname}/parboiled-core.jar
	ln -s /usr/share/java/parboiled/parboiled-java.jar $pkgdir/usr/share/java/${pkgname}/parboiled-java.jar
	ln -s /usr/share/java/pegdown/pegdown.jar $pkgdir/usr/share/java/${pkgname}/pegdown.jar
}

md5sums=('fb9a948d22561e48af9cc9fb462275f9'
         '699aa3829c921167636a0b44cc5db4e0')
sha256sums=('11cfcbdb065f96d9bda828c00a0ac3928b98d4aa5042aa9654fe40a7948c4c8f'
            'd5b01bbfbcb8206f0f89e76bbd98e84047e0034eb53dd35c497320e50cc5ae99')
