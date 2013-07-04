# Maintainer: Peace4all <markspost at rocketmail dot com>
# Contributors: Hiz <hizdiez[at]gmail[dot]com>, Falcata <zauberexonar[at]gmail[dot]com>

pkgname=qavimator-svn
pkgver=272 
pkgrel=5
pkgdesc="Qt port of Vince Invincible's avimator, bvh 3D animation editor for SecondLife"
arch=('i686' 'x86_64')
url="http://www.qavimator.org/"
license=('GPL2')
depends=('qt4' 'freeglut')
makedepends=('subversion')
source=('qavimator-code::svn+http://svn.code.sf.net/p/qavimator/code/'
	'qavimator.desktop'
	'http://img.informer.com/icons_mac/png/48/54/54703.png')
md5sums=('SKIP'
	 'ff1a7a77f4722ad276b8f5982d4a33af'
	 '7777a82e0ef9884dde6c42c65f51ec16')

pkgver() {
  cd $srcdir/qavimator-code
  svnversion
}

build() {
  cd $srcdir/qavimator-code

  sed -i -e "s|Edt|Edit|" \
  $(find . -name 'mainapplicationform.ui')

  qmake-qt4 -config -release
  make
}

package() {
  cd $srcdir/qavimator-code
  make INSTALL_ROOT="${pkgdir}" install
  install -d $pkgdir/usr/share/{pixmaps,applications}
  install -Dm644 $srcdir/54703.png \
  $pkgdir/usr/share/pixmaps/qavimator.png
  install -Dm644 $srcdir/qavimator.desktop \
  $pkgdir/usr/share/applications/qavimator.desktop
}
