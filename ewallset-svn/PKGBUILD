# $Id: PKGBUILD,v 1.12 2009/05/04 09:40:30 pressh Exp $
# Maintainer: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>
# Contributor: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>

pkgname=ewallset-svn
pkgver=3
pkgrel=1
pkgdesc="a e17 program to work with thunar to help user set wallpaper without use of e17 default wallpaper module"
arch=('i686' 'x86_64')
groups=('e17-libs-svn' 'e17-svn')
url="http://code.google.com/p/princeamds-code/"
license=('LGPL2')
depends=('glibc' 'emodule-remote-svn')
makedepends=('svn')
conflicts=('ewallset')
provides=('ewallset')
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_svntrunk="http://princeamds-code.googlecode.com/svn/trunk/C/ewallset"
_svnmod="ewallset"
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
