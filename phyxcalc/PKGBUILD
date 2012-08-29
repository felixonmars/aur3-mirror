
pkgname=phyxcalc
pkgver=200
pkgrel=1
pkgdesc="A KDE 4 utility that allows you to manage disks, partitions, and file systems."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/phyxcalc/"
license=('GPL2')
depends=('kdebase-runtime' 'qwt>=6')
makedepends=('cmake' 'automoc4' 'subversion')
optdepends=()
#install=phyxcalc.install
provides=()
conflicts=()

_svntrunk=svn://svn.code.sf.net/p/phyxcalc/code/trunk
_svnmod=phyxcalc-code

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_RPATH=ON -DCMAKE_BUILD_TYPE=RELEASE
  qmake
  make INSTALL_ROOT=${pkgdir} install
 
 # desktop file
  install -Dm644 "${startdir}"/phyxcalc.desktop \
    "$pkgdir/usr/share/applications/phyxcalc.desktop"

   # icon
  install -Dm644 "$srcdir/$_svnmod"/images/PhyxCalc.png \
    "$pkgdir/usr/share/pixmaps/PhyxCalc.png" 
}
