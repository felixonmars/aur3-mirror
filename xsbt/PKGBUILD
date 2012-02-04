# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=xsbt
pkgver=0.10.0
pkgrel=1
pkgdesc="sbt is a simple build tool for Scala projects that aims to do the basics well"
arch=('any')
url="http://github.com/harrah/xsbt/tree/0.9"
license=('BSD')
depends=('java-runtime')
source=(sbt-launch-$pkgver.jar::http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/$pkgver/sbt-launch.jar xsbt.sh)
md5sums=('9d8ab145a3c4d6d5ee9f76cae6082308'
         'ed5e16161cecd7a11b5a3cc6f61cf666')

package() {
	cd $startdir/

	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/xsbt/
	cp $srcdir/sbt-launch-${pkgver}.jar ${pkgdir}/usr/share/xsbt/
	
	sed "s/\${pkgver}/${pkgver}/g" ${srcdir}/xsbt.sh > ${pkgdir}/usr/bin/xsbt
	chmod +x ${pkgdir}/usr/bin/xsbt
}
