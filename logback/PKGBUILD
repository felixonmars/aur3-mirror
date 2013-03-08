# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=logback
pkgver=1.0.9
pkgrel=1
pkgdesc="Logback is java logging framework. Logback is intended as a successor to the popular log4j project."
arch=('any')
url="http://logback.qos.ch/"
license=('LGPL2.1')
depends=('java-environment' 'slf4j')
optdepends=('groovy')
source=(${url}dist/${pkgname}-${pkgver}.tar.gz setClasspath.sh)

package() {
	cd ${srcdir}

	install -D -m644 setClasspath.sh ${pkgdir}/usr/share/java/${pkgname}/setClasspath.sh

	cd ${pkgname}-${pkgver}

	for i in access classic core; do
		install -m644 ${pkgname}-${i}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
	for i in ${pkgdir}/usr/share/java/${pkgname}/*.jar; do
		_filename=${i##*\/}
		ln -s ${_filename} ${pkgdir}/usr/share/java/${pkgname}/${_filename/-${pkgver}/}
	done
}

md5sums=('03968f0e29d515a67c3bc2843e6e2049'
         '57e5bfeb3167f070f94e9e00bc82140f')
sha256sums=('81c9a248cea1a0bcfe397100e768124b55d09b26949c93a92e746ead3c436acb'
            'a02ace4b6fa3c460a1c6a18758969ef3ce9f3d0a6567ab47c47ef19ed2afd793')
