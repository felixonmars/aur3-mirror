# Contributor: Piotr Beling <qwak@w8.pl>
pkgname="eclipse-i18n-packbidi"
pkgver="3.2.1"
pkgrel="1"
pkgdesc="Arabic and Hebrew translations for the Eclipse platform"
url="http://www.eclipse.org/"
depends=('eclipse')
arch=(i686 x86_64)
source=("http://download.eclipse.org/eclipse/downloads/drops/L-${pkgver}_Language_Packs-200609210945/NLpackBidi-eclipse-SDK-${pkgver}-gtk.zip")
md5sums=('358891610a775f9e68f08b37c9a4dc07')

build() {
	mkdir -p ${startdir}/pkg/opt
	cd ${startdir}/pkg/opt
	mv ${startdir}/src/eclipse .
	find ${startdir}/pkg/opt/eclipse -type d -exec chmod 755 {} \;
	find ${startdir}/pkg/opt/eclipse -type f -exec chmod 644 {} \;
}
