# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=fim-svn
pkgver=273
pkgrel=1
pkgdesc="Development version of a highly customizable and scriptable framebuffer image viewer based on fbi"
arch=('i686')
url="https://www.autistici.org/dezperado/"
license=('GPL')
depends=('libungif' 'libpng' 'libjpeg' 'libtiff' 'readline')
makedepends=('subversion')
options=('!makeflags')
source=()
md5sums=()

_svntrunk=http://code.autistici.org/svn/fim/trunk/
_svnmod=fim

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/$_svnmod-build
  cp -r ${srcdir}/$_svnmod $srcdir/$_svnmod-build || return 1
  cd ${srcdir}/$_svnmod-build

  #
  # BUILD
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}
