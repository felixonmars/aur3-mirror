# Maintainer: mockfrog <arch AT mockfrog DOT de>
pkgname=numptyphysics-svn
pkgver=149
pkgrel=1
pkgdesc="a drawing puzzle game in the spirit of Crayon Physics"
arch=('i686' 'x86_64')
url="http://numptyphysics.garage.maemo.org"
license=('GPL')
depends=('sdl_image' 'sdl_ttf' 'hicolor-icon-theme' 'desktop-file-utils')
source=(happyhttp.cpp.patch)
md5sums=('d0ad9ba05d2b385342890b2e8be2828a')
install=(numptyphysics-svn.install)
_svntrunk=https://vcs.maemo.org/svn/numptyphysics/trunk
_svnmod=numptyphysics

build() {
  cd "$srcdir"

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
  #
  # BUILD
  #
  aclocal
  ./autogen.sh
  ./configure --prefix=/usr
  patch < ../../happyhttp.cpp.patch
  make || return 1
}

function package() {
  cd "${srcdir}/${_svnmod}-build"
  make DESTDIR="${pkgdir}/" install
}
