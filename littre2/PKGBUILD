# Contributor: Rémy EVEN <evenremy@gmail.com>, snoopy33
pkgname=littre2
pkgver=2.0
pkgrel=1
pkgdesc="The great french dictionary of Émile Littré (Qt)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/dictionnaire-le-littre/"
license=('GPL3')
depends=('qt')
install=$pkgname.install
source=(http://dictionnaire-le-littre.googlecode.com/files/Littre-source-${pkgver}.tar.bz2 \
 	$pkgname.desktop\
	$pkgname.install)

md5sums=('c71666ae4cf6353d2bbb7e98dcca9159'
         '8d5d8a0d397eb446b47b413da331f7b7'
         'c553cee6a3cdbc471d2ab972058247af')


build() {
  cd "$srcdir/Littre-source-$pkgver"
  qmake || return 1
  make || return 1
  install -D ../${pkgname}.desktop ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
  install -D "ui/Girls I do adore....png" ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -d bin/ ${pkgdir}/opt/${pkgname}/ || return 1
  install -D bin/* ${pkgdir}/opt/${pkgname}/ || return 1
  install -D Licence-CeCILL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt || return 1
}

