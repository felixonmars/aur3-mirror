# $Id: PKGBUILD,v 1.12 2009/05/04 09:40:30 pressh Exp $
# Maintainer: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>
# Contributor: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>

pkgname=esu-svn
pkgver=1833
pkgrel=1
pkgdesc="E17 application like gksu for graphical su"
arch=('i686' 'x86_64')
groups=('e17-libs-svn' 'e17-svn')
url="http://www.enlightenment.org"
license=('LGPL2')
depends=('eina-svn' 'e_dbus-svn' 'efreet-svn' 'elementary-svn' )
makedepends=('svn')
conflicts=('esu')
provides=('esu')
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_svntrunk="svn://elivecd.org/applications/esu"
_svnmod="esu"
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
