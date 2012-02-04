# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=alacarte-devel
pkgver=436
pkgrel=1
pkgdesc="Menu editor for GNOME - development version."
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL2')
depends=('gnome-menus>=2.24.0' 'gnome-python>=2.22.3' 'gnome-common')
makedepends=('subversion' 'intltool')
provides=('alacarte')
replaces=('alacarte')
source=()
md5sums=()

_svntrunk=http://svn.gnome.org/svn/alacarte/trunk
_svnmod=alacarte

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install
}
