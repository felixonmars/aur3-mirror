# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Original Contributor: Tobias Kieslich <tobias@justdreams.de>
# Support Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Martin Sand <dborn@gmx.net>

pkgname=yafaray-svn
pkgver=468
pkgrel=2
pkgdesc="Raytracing open source render engine"
arch=('i686' 'x86_64')
url="http://www.yafaray.org/"
license=('LGPL2')
depends=('libpng' 'libjpeg' 'freetype2' 'openexr' 'libxml2')
optdepends=('qt: QT GUI' 'python2: Blender exporter')
makedepends=('scons' 'subversion' 'swig' 'qt')
source=()
md5sums=()

_svntrunk="svn://svn.yafaray.org/repo/yafaray/mainline"
_svnmod="yafaray"
_exportersvntrunk="svn://svn.yafaray.org/repo/yafaray-blender/mainline"
_exportersvnmod="yafaray-blender"

build() {
  cd "$srcdir"/
  msg "Connecting to $_svnmod SVN server......."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up -r $pkgver
    cd ..
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "Connecting to Blender exporter SVN server......."
  if [ -d $_exportersvnmod/.svn ]; then
    cd $_exportersvnmod && svn up
    cd ..
  else
    svn co $_exportersvntrunk --config-dir ./ $_exportersvnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir"/$_svnmod-build ]; then
      rm -rf "$srcdir"/$_svnmod-build
  fi
  cp -r "$srcdir"/$_svnmod "$srcdir"/$_svnmod-build
  cd "$srcdir"/$_svnmod-build

  msg "Writing user-config.py"
  echo "PREFIX = '"$pkgdir"/usr'" > user-config.py
  echo "REL_CCFLAGS = '$CFLAGS -ffast-math'" >> user-config.py
  echo "WITH_YF_QT = 'true'" >> user-config.py
  echo "YF_QTDIR = '/usr'" >> user-config.py

  sed -i 's|$YF_PLUGINPATH|/usr/lib/yafaray|' tools/writeconfig.py

  scons
  scons swig
}

package() {
  cd "$srcdir"/$_svnmod-build
  scons install

  # install python bindings and blender export scripts
  install -d -m755 "$pkgdir"/usr/share/blender/scripts
  install -m644 bindings/python/* "$pkgdir"/usr/share/blender/scripts
  install -m644 "$srcdir"/$_exportersvnmod/*.py "$pkgdir"/usr/share/blender/scripts
}
