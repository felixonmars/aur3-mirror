# Contributor: Perttu Ahola <gmail/celeron55>
# Contributor: Alex Hall <alumni.purdue.edu/hall12>
# Maintainer: Mathieu Gaborit <mat.gaborit@gmx.com>
pkgname=heekscnc-svn
pkgver=2
pkgrel=2
pkgdesc="CNC Plugin for HeeksCAD"
arch=('i686' 'x86_64')
url=('http://code.google.com/p/heekscnc')
makedepends=('subversion' 'cmake')
depends=('python2' 'wxgtk' 'gtkglext' 'heekscad-svn')
optdepends=('libarea: functions for pocketing and profiling operations'
		'opencamlib: provides support for zig-zag operation')
provides=('heekscnc')
conflicts=('heekscnc' 'heekscnc-git')
license=('BSD')
source=('PythonStuff.cpp.patch')
md5sums=('6dc89c43f65bf8bd82c59d53f8658ee4')

_svntrunk=http://heekscnc.googlecode.com/svn/trunk
_svnmod=trunk

prepare () {

  cd $srcdir
  msg "Cloning svn repository..."

  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod
    svn update
  else
    svn checkout $_svntrunk $_svnmod
  fi
}

build() {
	cd $srcdir

	msg "Patching..."

	patch -p0 < PythonStuff.cpp.patch

  mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8' -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' ../$_svnmod
	make
}

package() {
  make -C $srcdir/build install
	# Copy license
  install -Dm644 $srcdir/$_svnmod/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: et sw=2 ts=2
