# Maintainer : Antoine Albertelli < antoinea101 at gmail dot com >
# Contributor: Eric Forgeot < http://anamnese.online.fr >
pkgname=rolisteam
pkgver=1.6.1
pkgrel=1
pkgdesc="An online role game playing software."
arch=('i686'  'x86_64')
url="http://www.rolisteam.org"
license=('GPL')
depends=('phonon' 'qt4')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('SKIP')

build() {
	# Generates translation files
	cd $srcdir/${pkgname}_${pkgver}/traduction
	lrelease-qt4 *.ts

    # Simple patch on phonon include directories
	cd $srcdir/${pkgname}_${pkgver}
	sed -i -e "s/<Phonon/<phonon/" src/LecteurAudio.h

    # Generates the makefile and runs it.
	qmake-qt4 
	make
} 

package() {
	cd $srcdir/${pkgname}_${pkgver}
    install -D -m755 bin/rolisteam $pkgdir/usr/bin/rolisteam
	install -D -m644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}

