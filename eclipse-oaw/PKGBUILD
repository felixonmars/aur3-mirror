# Contributor: Igor Dejanovic <igor.dejanovic (at) gmail.com>

pkgname=eclipse-oaw
pkgver=4.3.1
_pkgver=20090107-2000PRD
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="openArchitectureWare is modular MDA/MDD generator framework"
license=('EPL')
url="http://www.openarchitectureware.org/"
depends=('eclipse' 'eclipse-emf')
optdepends=('eclipse-gmf' 'eclipse-mdt-uml2')
source=("http://www.openarchitectureware.org/pub/downloads/dist/oaw${pkgver}/org.openarchitectureware.sdk.feature-${pkgver}.${_pkgver}.zip")
md5sums=('e67e4f7c8967ad345c772d1f29e91e6a')

build() {
	_dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
	install -d -m755 $_dest || return 1
	find ${srcdir}/eclipse -type f -exec chmod 644 {} \; || return 1
	find ${srcdir}/eclipse -type d -exec chmod 755 {} \; || return 1

	cp -r ${srcdir}/eclipse/features $_dest/
	cp -r ${srcdir}/eclipse/plugins $_dest/
}

