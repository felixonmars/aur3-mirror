# Maintainer: Nicola Bignami

pkgname=fgcomgui-svn
pkgver=20130302
pkgrel=1
pkgdesc="Provides GUI for FlightGear's FGCOM communications addon - SVN"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fgcomgui/"
license=('GPL')
depends=('qt4' 'fgcom-svn')
makedepends=('scons' 'sed')
provides=('fgcomgui')
conflicts=('fgcomgui')

_svnroot="http://fgcomgui.googlecode.com/svn/trunk/"
_svnname="fgcomgui"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [ -d $_svnname ] ; then
    cd $_svnname && svn update
    msg "The local files are updated."
  else
    svn co $_svnroot $_svnname
  fi

  msg "SVN checkout done or server timeout"
  msg "Building package..."
  chmod a+rw "$srcdir/$_svnname" -R
  cd "$srcdir/$_svnname"
  sed -i 's@rcc@rcc-qt4@' SConstruct
  sed -i 's@BuildDir@VariantDir@' SConstruct
  scons
}

package() {
  cd "$srcdir/$_svnname"
  scons prefix="$pkgdir/usr"
  scons install
}
 
