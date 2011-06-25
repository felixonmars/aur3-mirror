# Maintainer: Michael P <ptchinster@archlinux.us>

pkgname=neuroph
pkgver=2.5rc1
pkgrel=1
pkgdesc="lightweight Java neural network framework"
arch=('any')
url="http://neuroph.sourceforge.net/"
license=('Apache2')
groups=()
depends=('jre>=1.6')
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/neuroph/files/${pkgname} ${pkgver}/${pkgname}_${pkgver}u1.zip")
noextract=()

build() {
	mkdir -p "${pkgdir}/usr/src/${pkgname}/"
	
	cd "${srcdir}/${pkgname}_${pkgver}u1"
	mv * "${pkgdir}/usr/src/$pkgname/"
}

md5sums=('1bf3a6be94c07afcc83278e6c8b8359f')
