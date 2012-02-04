# Contributor: Hugo Doria <hugodoria@gmail.com>
# Use versionpkg to update.

pkgname=billreminder-svn
pkgver=648
pkgrel=2
pkgdesc="Small and quick accounting application designed to allow for easy tracking of bills"
arch=('i686')
url="http://billreminder.sourceforge.net/"
depends=('python-pysqlite' 'python-notify' 'dbus-python' 'setuptools' 'desktop-file-utils' 'pygobject' 'pygtk')
makedepends=('subversion' 'autoconf' 'automake' 'gnome-common' 'make')
license=('MIT')
provides=('billreminder')
conflicts=('billreminder')
source=()
md5sums=()
options=('!libtool')

_svntrunk=http://svn.gnome.org/svn/billreminder/trunk
_svnmod=billreminder

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  ./autogen.sh --prefix=/usr
  make DESTDIR=${pkgdir} install || return 1
  
  rm -rf ${srcdir}/${_svnmod}-build
}

