# Contributor: Christopher Heien <chris.h.heien@gmail.com>

pkgname=vaadin
pkgver=6.6.4
pkgrel=1
pkgdesc="Java web application UI framework." 
arch=('i686' 'x86_64')
url="http://www.vaadin.com"
license=('Apache 2.0')
depends=('java-runtime')
source=(http://vaadin.com/download/release/6.6/${pkgver}/${pkgname}-${pkgver}.jar)
noextract=( ${pkgname}-{pkgver}.jar )
sha1sums=('e032976d046a88a359bf10c600f6e1b71c8675ba')

build() {
	install -dm755 ${pkgdir}/usr/share/java/${pkgname} || return 1
	install -m644 ${srcdir}/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname} || return 1
}

