# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>

pkgname=glassfish
pkgver=2.1.1_b31g
pkgrel=2
pkgdesc='Java application server'
url='https://glassfish.dev.java.net/'
license=('GPL' 'CDDL')
depends=('java-runtime=<6' 'apache-ant')
makedepends=('java-runtime')
arch=('i686' 'x86_64')
options=('!strip')
source=(http://download.java.net/javaee5/v2.1.1_branch/promoted/Linux/glassfish-installer-v${pkgver/_/-}-linux.jar)
sha256sums=('774c4321de874a1c3ed5c84cf0d41a0a19eb4e145fd1ac3dc54879e36b59e4a2')
noextract=(glassfish-installer-v${pkgver/_/-}-linux.jar)
install=${pkgname}.install

build() {
	cd ${srcdir}
	echo a | java -Xmx256m -jar glassfish-installer-v${pkgver/_/-}-linux.jar -console

	cd glassfish
	chmod -R +x lib/ant/bin

	cd ..
	mkdir ${pkgdir}/opt
	mv glassfish ${pkgdir}/opt/
}
