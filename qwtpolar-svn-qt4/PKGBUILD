# Maintainer: Gunther Schulz < mail at guntherschulz.de > 
# Contributor: Kévin Guilloy <kevin at guilloy dot ath dot cx>
pkgname=qwtpolar-svn-qt4
pkgver=111
pkgrel=1
pkgdesc="Qwt polar is an extension of the Qwt library to support polar plots."
arch=('i686' , 'x86_64')
url="http://qwtpolar.sourceforge.net/"
license=('Qwt License, Version 1.0')
depends=('qt4' 'qwt')
conflicts=('qwtpolar')
makedepends=('qt4 subversion')

_svntrunk='https://svn.code.sf.net/p/qwtpolar/code/trunk/qwtpolar'
_svnmod='qwtpolar'

build() {
  cd "$startdir/src"
  svn co $_svntrunk --config-dir ./ $_svnmod

  msg 'SVN checkout or server timeout'
  msg 'Building sofware...'

  cd qwtpolar/
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/doc/\/usr\/share\/doc\/qwt\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/include/\/usr\/include\/qwt\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/lib/\/usr\/lib\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/features/\/usr\/share\/qwt\/features\//' qwtpolarconfig.pri
  sed -i -e 's/^.*QwtPolarDesigner//' qwtpolarconfig.pri
  sed -i -e 's/^.*QwtPolarExamples//' qwtpolarconfig.pri
  echo "INCLUDEPATH += /usr/include/qwt" >> qwtpolarbuild.pri

  qmake-qt4
  make

  cd ..
}

package() {
  cd "$startdir/src/qwtpolar"

  make INSTALL_ROOT="$pkgdir/" install
}
