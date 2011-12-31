# Contributor:  Sam Weston <admin@samuelweston.com>
# Contributor:  Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=icewm-cvs
pkgver=20111230
_internalver=1.3.8pre1
pkgrel=1
pkgdesc="A Window Manager designed for speed, usability, and consistency. Develop 1.3 CVS branch."
arch=('i686' 'x86_64')
url="http://www.icewm.org/"
provides=('icewm')
conflicts=('icewm')
license=('LGPL')
makedepends=('cvs' 'linuxdoc-tools')
depends=('gcc-libs' 'libxrandr' 'libxft' 'libsm' 'libxinerama' 'giflib')
source=(icewm.desktop icewm.svg.patch)
md5sums=(cad8ea1ab2a1b6a0e2a205fdf81d9ac3 448b956a409da9cf7d6886ff48e5c03e)
_cvsroot=":pserver:anonymous:@icewm.cvs.sourceforge.net:/cvsroot/icewm"
_cvsmod="icewm-1.2"

build()
{
  cd ${srcdir}

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -r icewm-1-3-BRANCH $_cvsmod
    cd $_cvsmod
  fi
  ./autogen.sh

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build
  patch -p0 < ../icewm.svg.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc
  make

  # build docs
  (
    cd doc
    make
  )
}

package()
{
  cd ${srcdir}/$_cvsmod-build

  make DESTDIR=${pkgdir} PACKAGE=$pkgname install
  install -D -m644 ${srcdir}/icewm.desktop ${pkgdir}/etc/X11/sessions/icewm.desktop

  # install docs
  install -d ${pkgdir}/usr/share/doc/icewm-$_internalver/
  install -D -m644 doc/icewm*.html ${pkgdir}/usr/share/doc/icewm-$_internalver/
}
