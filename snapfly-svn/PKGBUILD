# Maintainer: Ilya Medvedev <medved55rus [at] gmail [dot] com>

pkgname=snapfly-svn
pkgver=233
pkgrel=1
pkgdesc="Lightweight GTK+ menu written in python"
arch=('any')
url="http://code.google.com/p/snapfly/"
license=('GPL3')
depends=('pygtk' 'python2-pyinotify' 'dbus-python')
provides=('snapfly')
conflicts=('snapfly')
source=()
md5sums=()
_svntrunk="http://snapfly.googlecode.com/svn/trunk/"
_svnmod="snapfly"

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf "${srcdir}/${_svnmod}-build"
  cp -a "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  #
  # BUILD
  #

  # Use Python 2
  sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' src/launcher.py

  python2 setup.py install --root=${pkgdir}
}
