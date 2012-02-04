# Maintainer: lorim <lorimz AT gmail DOT com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>

pkgname=libmtp-cvs
pkgver=20101126
pkgrel=1
pkgdesc="library implementation of the Media Transfer Protocol -- CVS build"
arch=("i686" "x86_64")
url="http://libmtp.sourceforge.net"
license=("LGPL")
depends=("libusb")
makedepends=('cvs' 'doxygen')
provides=('libmtp=1.0.3')
conflicts=('libmtp')
options=('!libtool')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@libmtp.cvs.sourceforge.net:/cvsroot/libmtp"
_cvsmod="libmtp"

build() {
  cd "$srcdir"

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

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  yes n | ./autogen.sh
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
  install -D -m0644 libmtp.rules \
         $pkgdir/lib/udev/rules.d/52-libmtp.rules
  install -D -m0644 libmtp.fdi \
         $pkgdir/usr/share/hal/fdi/information/20thirdparty/libmtp.fdi
}
