# Maintainer: Uroš Vampl <mobile.leecher at gmail dot com>

pkgname=tigervnc
pkgver=1.2.0
pkgrel=6
_xorgver=1.12.2
pkgdesc="TigerVNC is a suite of VNC servers and clients that have a focus on performance and remote display functionality. Originally this software was based on the (never released) VNC 4 branch of TightVNC."
arch=('i686' 'x86_64')
url="http://www.tigervnc.org"
license=('GPL')
depends=('pam' 'gnutls' 'libjpeg-turbo' 'libxft' 'libxinerama' 'libxcursor' 'libxtst' 'libxfont' 'pixman' 'xorg-xauth' 'xorg-xsetroot' 'xkeyboard-config' 'libgl')
makedepends=('cmake' 'nasm' 'xorg-font-util' 'xorg-util-macros' 'bigreqsproto' 'compositeproto' 'damageproto' 'randrproto' 'resourceproto' 'scrnsaverproto' 'videoproto' 'xcmiscproto' 'xf86vidmodeproto' 'xtrans' 'mesa')
conflicts=('tightvnc')
source=(http://downloads.sourceforge.net/tigervnc/${pkgname}-${pkgver}.tar.gz
        ftp://ftp.freedesktop.org/pub/xorg/individual/xserver/xorg-server-${_xorgver}.tar.bz2
        xorg111.patch
        xorg112.patch
        gnutls.patch
        gethomedir.patch
        cmakelists.patch)
md5sums=('3a5755b4ed600a81c3a17976c6f8420d'
         '791f0323b886abb7954de7f042bb7dc6'
         'b680b55f7f9f569cd26ac0b330012a8b'
         'f73e055153889ae7b5aac8e697f7a841'
         '1a5fe8867ab3e49e20aafc70c415494f'
         'fa059baabe72308bf82622bca73cb3e0'
         '6ef923c71cc0e79c4b37eb3b124eea75')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cp -r ${srcdir}/xorg-server-${_xorgver}/* unix/xserver
  patch -Np1 -i ${srcdir}/gnutls.patch
  patch -Np1 -i ${srcdir}/gethomedir.patch
  patch -Np1 -i ${srcdir}/cmakelists.patch
  patch -Np1 -i ${srcdir}/xorg111.patch
  patch -Np1 -i ${srcdir}/xorg112.patch

  cmake -G "Unix Makefiles" \
	-DCMAKE_INSTALL_PREFIX=/usr -DUSE_INCLUDED_FLTK=yes
  make

  cd unix/xserver
  patch -Np1 -i ../xserver110.patch
  autoreconf -fiv
  ./configure --prefix=/usr \
	--disable-static --disable-xinerama --without-dtrace \
	--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
	--disable-xwin --disable-xephyr --disable-kdrive --with-pic \
	--disable-config-dbus --disable-config-hal --disable-config-udev \
	--disable-unit-tests --disable-devel-docs --disable-dri \
	--enable-dri2 --enable-glx --enable-glx-tls
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  cd unix/xserver/hw/vnc
  make DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/lib/xorg/modules/extensions/libvnc.la

  # start vncconfig in no-window mode, the window is annoying :)
  sed -i 's/iconic/nowin/' ${pkgdir}/usr/bin/vncserver
}
