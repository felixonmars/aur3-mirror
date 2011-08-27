# Contributor: Piotr Beling <qwak@w8.pl>
pkgname="eclipse-i18n-pack2a"
pkgver="3.2.1"
pkgrel="1"
pkgdesc="Danish, Dutch, Finnish, Greek, Norwegian, Portuguese, Swedish and Turkish translations for the Eclipse platform"
url="http://www.eclipse.org/"
depends=('eclipse')
arch=(i686 x86_64)
source=("http://download.eclipse.org/eclipse/downloads/drops/L-${pkgver}_Language_Packs-200609210945/NLpack2a-eclipse-SDK-${pkgver}-gtk.zip")
md5sums=('bf3067667799953bb5f941c4a20a9c07')

build() {
	mkdir -p ${startdir}/pkg/opt
	cd ${startdir}/pkg/opt
	mv ${startdir}/src/eclipse .
	find ${startdir}/pkg/opt/eclipse -type d -exec chmod 755 {} \;
	find ${startdir}/pkg/opt/eclipse -type f -exec chmod 644 {} \;
}
