# Contributor: Kostin Dmitrij [DsTr] <kostindima@gmail.com>

pkgname=gloox-doc-qthelp
pkgver=1.0
_pkgver=`echo $pkgver | sed 's/_/-/'`
pkgrel=1
pkgdesc="Gloox API for Qt Assistant"
arch=(any)
url="http://camaya.net/gloox"
license=('GPL')
makedepends=('subversion' 'doxygen>=1.5.8')
depends=(qt)
conflicts=()
provides=()
install=gloox-doc-qthelp.install

source=(http://camaya.net/download/gloox-$_pkgver.tar.bz2)
md5sums=('f8eacf1c6476e0a309b453fd04f90e31')

build() {
 cd $srcdir/gloox-$_pkgver
 sed -i 's/GENERATE_HTMLHELP      = NO/GENERATE_HTMLHELP = YES/' Doxyfile
 sed -i 's/PROJECT_NAME           = gloox/gloox API Documentation/' Doxyfile

echo "GENERATE_QHP           = YES
QCH_FILE               = ../gloox-doc.qch
QHP_NAMESPACE          = org.gloox
QHP_VIRTUAL_FOLDER     = doc
QHG_LOCATION           = qhelpgenerator" >> Doxyfile
 doxygen
 mkdir $pkgdir/usr/share/doc/qt/qch -p
 cp gloox-doc.qch $pkgdir/usr/share/doc/qt/qch
}
