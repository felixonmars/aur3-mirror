# Maintainer: Feragon <feragon57@gmail.com>
pkgname=groimp
pkgver=1.4.2
pkgrel=1
pkgdesc="3D modelling platform written in Java"
arch=("i686" "x86_64")
url="http://www.grogra.de/"
license=('GPL2')
depends=('java-runtime')
optdepends=('jogl: Use OpenGL for 3D visualization')
source=(http://downloads.sourceforge.net/project/groimp/groimp/1.4.2/GroIMP-${pkgver}.zip groimp.sh)
md5sums=("437244c6d557b9be5e5f43b288ee8936"
	 "1b91acd37b78f1f814706e7d890afe27")

build() {
  install -Dm775 groimp.sh ${pkgdir}/usr/bin/groimp
  cd "${srcdir}/GroIMP-${pkgver}"
  install -dm775 -g users ${pkgdir}/opt/${pkgname}
  cp -R * ${pkgdir}/opt/${pkgname}
}