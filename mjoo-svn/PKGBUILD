# Contributer: Leonard Ritter <paniq@paniq.org>

pkgname=mjoo-svn
provides=mjoo
pkgver=42
pkgrel=2
pkgdesc="mjoo is a new kind of live composition software for the Linux operating system."
url="http://www.mjoo.org/"
license="GPL"
depends=('pygtk' 'pygtkglext' 'python-numeric' 'python-pyopengl' 'python-ctypes' 'jack-audio-connection-kit' 'ladspa' 'dssi')
makedepends=('subversion' 'scons' 'make' 'gcc')
source=()
md5sums=()

_svntrunk=http://svn.zeitherrschaft.org/mjoo/trunk
_svnmod=mjoo

build() {
  cd $startdir/src
  # Be sure to have a ~/.subversion.  If it doesn't exist, touch it.
  touch ~/.subversion

  svn co $_svntrunk@$pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  scons install --no-cache prefix=$startdir/pkg/opt/mjoo || return 1

  cd ..
  rm -rf $_svnmod-build
} 
