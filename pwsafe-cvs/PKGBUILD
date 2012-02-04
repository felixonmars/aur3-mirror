# Contributor: David 'dante4d' Hajek <dante4d@gmail.com>
pkgname=pwsafe-cvs
pkgver=20090712
pkgrel=1
pkgdesc="A commandline program for managing encrypted password databases, CVS version"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pwsafe/"
license=('GPL')
groups=()
depends=('openssl' 'libxmu' 'readline')
makedepends=('cvs')
provides=('pwsafe')
conflicts=('pwsafe')
replaces=('pwsafe')
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_cvsroot=":pserver:anonymous:@pwsafe.cvs.sourceforge.net:/cvsroot/pwsafe"
_cvsmod="pwsafe"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d$_cvsroot checkout -P $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  aclocal        # generate aclocal.m4
  autoheader     # generate config.h.in from configure.ac
  automake       # generated Makefile.in from Makefile.am
  autoconf       # generate configure from configure.ac
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
