# Maintainer: libernux <dutchman55@gmx.com>

pkgname=projectcenter.app-svn
pkgver=33818
pkgrel=2
pkgdesc="GNUstep Integrated Devloppment Environment"
arch=(i686 x86_64)
url="http://gnustep.org/"
license=('GPL')
depends=()
makedepends=('subversion')
provides=(projectcenter.app)
conflicts=(projectcenter.app)
replaces=()
backup=()
install=
source=()
noextract=()
md5sums=()

_svntrunk="http://svn.gna.org/svn/gnustep/apps/projectcenter/trunk/"
_svnmod=projectcenter.app

build() {
  cd "$srcdir"
  . /usr/share/GNUstep/Makefiles/GNUstep.sh  

  if [ -d "$_svnmod/.svn" ]; then
    msg "SVN update $_svnmod"
    (cd $_svnmod && svn up -r $pkgver)
  else
    msg "SVN checkout $_svntrunk $_svnmod"
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout. Preparing sources..."

  cp -r "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"

  msg "Starting make..."

  make
  make DESTDIR="$pkgdir" install
}
