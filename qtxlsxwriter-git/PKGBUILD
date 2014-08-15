pkgname=qtxlsxwriter-git
_pkgname=QtXlsxWriter
pkgver=20140814
pkgrel=0
pkgdesc="QtXlsx library for working with excel files in Qt"
arch=('i686' 'x86_64')
url="http://qtxlsx.debao.me/"
license=('MIT')
source=('git://github.com/dbzhang800/QtXlsxWriter.git')
md5sums=('SKIP')

makedepends=('git')
depends=('qt5-base')

build(){
	cd $srcdir/${_pkgname}/
	qmake
	make -j4
}

package(){
	cd $srcdir/${_pkgname}/
	make INSTALL_ROOT=${pkgdir} install
	
}
	

