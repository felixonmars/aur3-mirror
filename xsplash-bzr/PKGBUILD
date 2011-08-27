# Contributor: Flamelab <panosfilip_at_gmail_dot.com>

pkgname=xsplash-bzr
_realname=xsplash
pkgver=56
pkgrel=1
pkgdesc="Xsplash is a userspace application that uses the X interface to draw a splash screen at boot."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/xsplash"
license=('GPL3')
depends=('gtk2' 'dbus-glib' 'cairo' 'freetype2')
makedepends=('atk' 'bzr' 'intltool' 'xdg-utils')
provides=(${_realname})
conflicts=(${_realname})
options=('!libtool' '!emptydirs')
source=('automake-fix.patch')

_bzrbranch=lp:xsplash
_bzrmod=xsplash

build() {
 
  cd ${srcdir}/

  msg "Connecting to the server...."

  bzr branch ${_bzrbranch} -q -r ${pkgver}

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${_bzrmod}-build ]; then
      rm -rf ${_bzrmod}-build
  fi
  
  cp -r ${_bzrmod} ${_bzrmod}-build
  cd ${_bzrmod}-build  
  
  msg "Patching autogen.sh..."
  patch -Np1 -i ${startdir}/automake-fix.patch || return 1
   
  ./autogen.sh --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make  DESTDIR=${pkgdir} install || return 1

 }

md5sums=('f54a69cc1f02e26085643eac3f5ede5a')
