# $Id: PKGBUILD,v 1.11 2008/04/07 21:49:29 pressh Exp $
# Maintainer: flaper87 <flaper87 at flaper87 dot org>
# Contributor: flaper87 <flaper87 at flaper87 dot org>
pkgname=evfs-cvs
pkgver=20080407
pkgrel=1
pkgdesc="The successor of EFSD"
arch=('i686' 'x86_64')
groups=('e17-cvs')
url="http://www.enlightenment.org"
license=('custom')
depends=('imlib2' 'gcc' 'automake' 'autoconf' 'm4' 'make' 'openssl' 'e-cvs' 'e_dbus-cvs' 'edje-cvs' 'efreet-cvs' 'etk-cvs' 'curl' 'heimdal' 'krb5-crypto' 'ecore-cvs' 'evas-cvs')
makedepends=('cvs')
conflicts=('evfs-cvs')
provides=('evfs-cvs')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@anoncvs.enlightenment.org:/var/cvs/e"
_cvsmod="e17/apps/evfs"

build() {
   cd $startdir/src
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_cvsmod $startdir/src/$_cvsmod-build
  cd $startdir/src/$_cvsmod-build

  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

# install license files
  install -Dm644 $startdir/src/$_cvsmod-build/COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  install -Dm644 $startdir/src/$_cvsmod-build/COPYING-PLAIN $startdir/pkg/usr/share/licenses/$pkgname/COPYING-PLAIN
      
  rm -r $startdir/src/$_cvsmod-build
}
