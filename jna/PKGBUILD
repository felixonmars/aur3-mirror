# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=jna
pkgver=3.5.1
pkgrel=1
pkgdesc="Easy access to native shared libraries for java"
arch=('any')
url="https://github.com/twall/jna"
license=('LGPL2.1')
depends=('java-runtime')
source=(https://maven.java.net/content/repositories/releases/net/java/dev/${pkgname}/jna/${pkgver}/jna-${pkgver}.jar
		https://maven.java.net/content/repositories/releases/net/java/dev/${pkgname}/platform/${pkgver}/platform-${pkgver}.jar
		setClasspath.sh)
noextract=('${pkgname}.jar' 'platform.jar')

package() {
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}

	cd $srcdir

	install -m644 -D jna-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	install -m644 -D platform-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	install -m644 -D setClasspath.sh ${pkgdir}/usr/share/java/${pkgname}
	ln -s jna-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/jna.jar
	ln -s platform-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/platform.jar
}

md5sums=('cb9d25ada94d5d541c48d8bff4dbf763'
         'fbb8eab20d86f6b944ce9bcfb13ff223'
         '6143253b0547e9c81f747d42b97a5781')
sha256sums=('3f8889f51d570a26f3ac2c1323e6be828bb73eb5e66cf25e979eb5b109d92021'
            'b0b30404f6a9e29d4d9a7b53fd47322e7137cab3846fd5f149d5589fc68c2126'
            '16de3dc2b354453f309aac9f1ce45a2db30aae51295c0753cb26d5e9f6676a24')
