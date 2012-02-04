# Contributor: Hubert Star <hubertstar@gmail.com>
pkgname=fitx-svn
pkgver=194
pkgrel=1
pkgdesc="Fun Input Toy for Linux, a Chinese input method base on scim-python."
arch=(i686 x86_64)
url="http://code.google.com/p/fitx"
license=('BSD')
depends=('gnustep-base' 'scim-python')
makedepends=('gnustep-make' 'sqlite3' 'subversion')
provides=("fitx")
conflicts=(fitx)
source=()
md5sums=()
_svntrunk="http://fitx.googlecode.com/svn/trunk/"
_svnmod="trunk"

build() {
  cd $startdir/src

  msg "Checking for previous build"
  if [[ -d $_svnmod/.svn ]]; then
    msg "Retrieving updates"
    cd $_svnmod
    svn up || return 1
  else
    msg "Retrieving complete sources"
    svn co $_svntrunk || return 1
    cd $_svnmod
  fi
  
  . /opt/GNUstep/System/Library/Makefiles/GNUstep.sh
  
  make || return 1
  
  make DESTDIR=$startdir/pkg install || return 1
}

