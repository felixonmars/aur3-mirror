# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=twitter4j
pkgver=2.2.2
pkgrel=1
pkgdesc="A Java library for TwitterAPI, supports OAuth"
arch=('i686' 'x86_64')
url="http://twitter4j.org"
license=('Apache')
depends=('java-runtime' 'slf4j')
source=(${url}/en/${pkgname}-${pkgver}.zip setClasspath.sh)

package() {
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}

	cd ${srcdir}

	install -m644 setClasspath.sh ${pkgdir}/usr/share/java/${pkgname}
	for a in async core media-support stream; do
		install -m644 lib/${pkgname}-${a}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
    for i in ${pkgdir}/usr/share/java/${pkgname}/*.jar; do
		_filename=${i##*\/}
		ln -s ${_filename} ${pkgdir}/usr/share/java/${pkgname}/${_filename/-${pkgver}/}
    done
}

md5sums=('c8ab0d6f1a5d550bc063821be2388607'
         'eb18e761893733c651af29162f10c27b')
sha256sums=('1ec7ee1904465e47c9aa29c5000d69723da91290c7c4a9d4ce413760fa1ae025'
            '0c6460923b0f31358260becfedfb320c1af4b6a6b7114091718e2e208ec37dc9')
