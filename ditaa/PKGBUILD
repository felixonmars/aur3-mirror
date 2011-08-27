# Maintainer: domanov <domanov@gmail.com>

pkgname=ditaa
pkgver=0_9
pkgrel=1
pkgdesc="Java utility to convert diagrams drawn using ascii art to bitmap"
arch=('i686' 'x86_64')
url="http://ditaa.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/0.9/${pkgname}${pkgver}.zip
	ditaa.sh)
md5sums=('23f2e5ede60ef7763309c08addca071a'
         'f49b726595c7b85aa004da042094b0e2')

build() {
  cd ${srcdir}
  install -Dm755 $pkgname${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/ditaa-${pkgver}.jar
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${pkgname}
}

