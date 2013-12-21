# Maintainer: Simon K <simon@booya.at>
# Contributor: Gareth R <newtackdesign@gmail.com>
pkgname=xflr5-svn
pkgver=6.09
pkgrel=07
pkgdesc="XFLR5 is an analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://xflr5.sourceforge.net/xflr5.htm"
license=('GPL')
depends=('qt4' 'pacman' 'mesa')
makedepends=('subversion' 'qt4-private-headers')
source=("$pkgname::svn+http://svn.code.sf.net/p/xflr5/code/branches/xflr5-${pkgver}-${pkgrel}"
	"xflr5.desktop")
#source=("$pkgname::svn+http://svn.code.sf.net/p/xflr5/code/trunk")
md5sums=('SKIP'
	'b4bab131937b01ae211a17ca533bcf33')


build() {
  cd $pkgname

  qmake-qt4 -makefile xflr5_${pkgver}.pro target.path=$pkgdir/usr/bin
  make  
}

package() {
  cd $pkgname
  #mv images/xflr5_128.png $pkgdir/usr/share/icons/hicolor/128x128/
  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/xflr5.desktop $pkgdir/usr/share/applications
  make PREFIX=/usr/bin INSTALL_ROOT="$pkgdir/" install
  make clean
  }

