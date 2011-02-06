# Contributor: Piotr Beling <qwak@w8.pl>
pkgname="eclipse-i18n-pack1"
pkgver="3.2.1"
pkgrel="1"
pkgdesc="German, Spanish, French, Italian, Japanese, Korean, Portuguese (Brazil), Traditional Chinese and Simplified Chinese translations for the Eclipse platform"
url="http://www.eclipse.org/"
depends=('eclipse')
arch=(i686 x86_64)
source=("http://download.eclipse.org/eclipse/downloads/drops/L-${pkgver}_Language_Packs-200609210945/NLpack1-eclipse-SDK-${pkgver}-gtk.zip")
md5sums=('3124c1065754acdfe81966f54f7da94c')

build() {
	mkdir -p ${startdir}/pkg/opt
	cd ${startdir}/pkg/opt
	mv ${startdir}/src/eclipse .
	find ${startdir}/pkg/opt/eclipse -type d -exec chmod 755 {} \;
	find ${startdir}/pkg/opt/eclipse -type f -exec chmod 644 {} \;
}
