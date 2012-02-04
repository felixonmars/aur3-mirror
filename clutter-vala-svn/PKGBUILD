# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=clutter-vala-svn
pkgver=3192
pkgrel=1
pkgdesc="Vala bindings for Clutter"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('clutter-svn' 'clutter-gst-svn' 'clutter-cairo-svn' \
  'clutter-gtk-svn' 'vala')
options=('!libtool')
provides=('clutter-vala')
conflicts=('clutter-vala')
source=()
md5sums=()

_svntrunk=http://svn.o-hand.com/repos/clutter/trunk/bindings/clutter-vala
_svnmod=clutter-vala

build() {
  cd "${srcdir}"

  msg "Connecting to $_svntrunk ..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"

  if [ -d ${_svnmod}-build ]; then
    msg "Deleting old build directory"
    rm -rf ${_svnmod}-build
  fi

  msg "Setting up build environment..."
  cp -r ${_svnmod} ${_svnmod}-build || return 1
  cd ${_svnmod}-build || return 1

  msg "Starting build"
  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
