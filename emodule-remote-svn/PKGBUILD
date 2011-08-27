# $Id: PKGBUILD,v 1.12 2009/05/04 09:40:30 pressh Exp $
# Maintainer: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>
# Contributor: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>

pkgname=emodule-remote-svn
pkgver=3
pkgrel=1
pkgdesc="E17 module that exports some of its main functions using E_Dbus"
arch=('i686' 'x86_64')
groups=('e17-libs-svn' 'e17-svn')
url="http://code.google.com/p/princeamds-code/"
license=('LGPL2')
depends=('glibc' 'e-modules-extra')
makedepends=('svn')
conflicts=('emodule-remote')
provides=('emodule-remote')
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_svntrunk="http://princeamds-code.googlecode.com/svn/trunk/C/remote"
_svnmod="remote"
build() {
   cd $srcdir

msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod 
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  
  rm -r $srcdir/$_svnmod-build

}
