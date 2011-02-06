# Maintainer : gbs <grosbedos@gmail.com>
pkgname=pycard-svn
pkgver=884
pkgrel=1
pkgdesc="Pycard is a fork of PythonCard wich is a GUI construction kit for building cross-platform desktop applications on Windows, Mac OS X, and Linux, using the Python language.."
url="http://trac.medianix.org/wiki/Pycard"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python>=2.3' 'wxpython')
makedepends=('subversion')
conflicts=()
replaces=()
backup=()
source=()
md5sums=()

_svntrunk=https://svn.nexlab.it/medianix/packages/main/pycard/trunk
_svnmod=pycard

build() {
  cd $startdir/src
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  python2.7 setup.py install --root=$startdir/pkg
  echo "#!/bin/bash" > $startdir/pkg/usr/bin/pycardedit
  echo "python2.7 /usr/lib/python2.7/site-packages/Pycard/tools/pycardedit/pycardedit.py" >> $startdir/pkg/usr/bin/pycardedit
  chmod +x $startdir/pkg/usr/bin/pycardedit
  rm $startdir/pkg/usr/bin/install-pycard.py
  rm -rf $startdir/src/$_svnmod-build
}
