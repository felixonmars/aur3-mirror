# Contributor: rolater rolater@yahoo.com
pkgname=minisip-svn
pkgver=2650
pkgrel=1
pkgdesc="SIP User Agent with focus on security: TLS, end-to-end security, SRTP, MIKEY (DH, PSK, PKE)"
url="http://www.minisip.org"
license="GPL/LPGL"
depends=('libglademm>=2.4' 'openssl>=0.9.7h')
makedepends=('subversion' 'perl')
conflicts=()
replaces=()
backup=()
install=()
source=()
md5sums=()
_svntrunk=svn://svn.minisip.org/minisip/trunk
_svnmod=minisip

build() {

  cd ${startdir}/src
  msg "Connecting to minisip svn server...."
  svn co $_svntrunk $_svnmod -r $pkgver
  msg "SVN checkout done or server timeout"

  msg "copying to build directory..."

  cp -pr $startdir/src/$_svnmod $startdir/src/$_svnmod-build

  cd $_svnmod-build

  msg "Starting make..."

  # this is critical not to change permissions on /usr/,/usr/bin,....
  perl -pi -e "s/umask/# umask/" ./build.pl 

  # another bug: this file is needed in order to compile:
  touch $startdir/src/minisip-build/minisip/minisip/gui/gtkgui/version.h

  # ok, now the (fixed) build script
  ./build.pl --prefix=/usr --destdir=$startdir/pkg install minisip || return 1 
  rm -rf $startdir/src/$_svnmod-build

}

# vim:syntax=sh
